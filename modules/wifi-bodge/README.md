# ⚠️ Wi-Fi 7 PCI Reset Hook (Arrow Lake Workaround)

## **The Issue**
The Intel Wi-Fi 7 (BE200) card on the HP OMEN Max (Arrow Lake platform) suffers
from a **firmware crash during ACPI S3 power state transitions** on Linux
kernels < 6.19 (and possibly later).

## What went wrong so badly that this hack is needed?
The `iwlwifi` driver attempts to transition the card to a low-power state
(`D3hot`) during system suspend. On this specific hardware/firmware combination,
the card's internal microcontroller crashes (`ADVANCED_SYSASSERT`) instead of
entering sleep. It fails to send a state acknowledgement to the kernel. Because
the card never technically "slept", it never "wakes up". It remains in a zombie
state where the PCI link is active, but the firmware is unresponsive to
commands.

## Why doesn't it work correctly?

The standard `modprobe -r` (module unload) approach fails because the `iwlwifi`
driver tries to send a "shutdown" command to the firmware as part of the unload
process. Since the firmware is already unstable or prone to crashing on this
command, the driver hangs or times out (`failure 110`), leaving the module
locked in kernel memory.

## Why does this bodge work?

This script bypasses the firmware's sleep logic entirely by performing a PCI
Hot-Unplug simulation.

1. **Pre-Suspend:** We write to `/sys/bus/pci/devices/.../remove`. This tears
down the device handle immediately without asking the firmware to sleep. The
kernel cuts power/link to the device.

2. **Post-Suspend:** We write to `/sys/bus/pci/rescan`. The kernel rediscovers
the "new" hardware. This forces a **Cold Boot** initialization of the card
(fresh firmware upload, register reset), effectively rebooting the Wi-Fi card
from scratch every time the laptop wakes up.

> [!IMPORTANT]
> Check for `Arrow Lake` or `BE200` fixes in
> `drivers/net/wireless/intel/iwlwifi` changelogs. Specifically, look for
> commits referencing `SYSASSERT` on suspend or `D3` power state quirks. Monitor
> this bug report (once filed) or search
> [lore.kernel.org](https://lore.kernel.org) for "Arrow Lake iwlwifi suspend".
> **Move to deprecated when:** You can run `systemctl suspend` without this
> script and `dmesg` no longer shows `ADVANCED_SYSASSERT` or
> `timeout waiting for FW reset ACK` upon wake.
