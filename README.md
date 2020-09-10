# Tmux Wi-fi Status

This is a Tmux status line plugin that displays your current wifi status, in
the style of [tmux-plugins](https://github.com/tmux-plugins).

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

```sh
set -g status-right '#{wifi_ssid} #{wifi_icon} | %d %B %Y | %I:%M%p '
```

### Configuration

The icons displayed by `${wifi_icon}` can be configured to whatever values you want, where `5` represents the
highest signal strength and `1` is the lowest. `off` means that the network adaptor is turned off.

```sh
set -g @tmux_wifi_icon_5 "☰"
set -g @tmux_wifi_icon_4 "☱"
set -g @tmux_wifi_icon_3 "⚌"
set -g @tmux_wifi_icon_2 "⚍"
set -g @tmux_wifi_icon_1 "⚊"
set -g @tmux_wifi_icon_off "⚋"
```

## OS Support

This plugin supports the following operating systems:

* macOS
* Linux (using `iw`)

Feel free to submit PRs to [support other OSs](CONTRIBUTERS.md).

## Installation

## Using [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

If you're familiar with TPM, you can add this plugin to the list of TPM plugins
in `.tmux.conf`:

```sh
set -g @plugin 'gmoe/tmux-wifi'
```

## Manual Installation

Clone the repo:

```sh
$ git clone https://github.com/gmoe/tmux-wifi ~/.tmux/plugins/tmux-wifi
```

Add this line to the bottom of `.tmux.conf`:

```sh
run-shell ~/.tmux/plugins/tmux-wifi/tmux-wifi.tmux
```

Reload TMUX environment:

```sh
$ tmux source-file ~/.tmux.conf
```

## License

[MIT](LICENSE.md)
