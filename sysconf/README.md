


steps to switch out vpn configs:

1. remove the old `wg*` via nmtui
2. add the new config via:
```bash
nmcli connection import type wireguard file /home/jaysh/dev/sysconf/configs/wg*.conf
# change the path accordingly
```
