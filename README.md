# Tmux Wi-fi Status (macOS)

This is a Tmux status line plugin for macOS displays your current wifi
settings, in the style of [tmux-plugins](https://github.com/tmux-plugins). 

SSID and signal icon:

![ssid-signal](/images/ssid-signal.png)

Signal strength in dB:

![strength](/images/strength.png)

## Usage

This plugin provides three format strings that you can use in your status line:
- `#{wifi_ssid}` - displays the SSID of your wireless network
- `#{wifi_strength}` - displays your wifi strength in dB
- `#{wifi_icon}` - displays an icon modelling signal strength

Here is an example status line: 

```
set -g status-right '#{wifi_ssid} #{wifi_icon} | %d %B %Y | %I:%M%p '
```

## Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

If you're familiar with TPM, you can add this plugin to the list of TPM plugins
in `.tmux.conf`:

    set -g @plugin 'gmoe/tmux-wifi-macos'

## Manual Installation

Clone the repo:

    $ git clone https://github.com/gmoe/tmux-wifi-macos ~/.tmux/plugins/tmux-wifi-macos

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/.tmux/plugins/tmux-wifi-macos/wifi-macos.tmux

Reload TMUX environment:

    $ tmux source-file ~/.tmux.conf

## License

[MIT](LICENSE.md)
