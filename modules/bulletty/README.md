# Bulletty Configuration

## Feeds

```bash
$ bulletty import ${HOME}/dev/modules/bulletty/feeds.opml
```

## Themes

Bulletty comes with the themes built-in to the binary. Either use the Rose Pine,
or build from source with this theme included:
```toml
scheme = "Tokyo Night Moon"
author = "folke"
# Backgrounds (Dark to Light)
base00 = "222436" # Background
base01 = "2f334d" # Selection / Status
base02 = "444a73" # Selection Background
base03 = "636da6" # Comments / Dim
base04 = "828bb8" # Dark Foreground
base05 = "c8d3f5" # Foreground (Text)
base06 = "e0eafc" # Light Foreground
base07 = "ffc777" # Light Background (Accent)

# Colors
base08 = "ff757a" # Red (Error)
base09 = "ffc777" # Orange
base0A = "ffc777" # Yellow (Date)
base0B = "c3e88d" # Green (Unread)
base0C = "86e1fc" # Cyan
base0D = "82aaff" # Blue (Accent)
base0E = "c099ff" # Purple
base0F = "ff757a" # Brown (Deprecated)
```
