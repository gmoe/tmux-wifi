# Tmux Wi-fi Status

This is a Tmux status line plugin that displays your current wifi
status, in the style of [tmux-plugins](https://github.com/tmux-plugins). 

SSID and signal icon:

<img
  width="147"
  alt="ssid-icon"
  src="https://user-images.githubusercontent.com/7128551/52537064-2bffc600-2d5a-11e9-9c9a-881f0a74ae78.png">

Signal strength in dB:

<img
  width="55"
  alt="strength"
  src="https://user-images.githubusercontent.com/7128551/52537065-31f5a700-2d5a-11e9-92d0-56fc8ac40dca.png">

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
