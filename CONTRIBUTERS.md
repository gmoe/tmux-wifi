## Adding compatibility for other wifi management programs

1. Add a .sh file with the name of your command in `scripts/modules/`, that defines at least two commands:

* `get_wifi_strength`, which outputs to stdout the absolute value of the signal strength in decibels
* `get_wifi_ssid`, which outputs to stdout the ssid of the connected wireless network

2. In the `.tmux` file, add a check in the case statement at the top, similar to the `iw` check, that then sources your .sh.
