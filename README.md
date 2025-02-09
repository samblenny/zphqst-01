<!-- SPDX-License-Identifier: Apache-2.0 OR MIT -->
<!-- SPDX-FileCopyrightText: Copyright 2025 Sam Blenny -->

# zphqst-01

**WORK IN PROGRESS**
**This doesn't actually do much of anything useful yet**

This repo has example code for the
[Zephyr Quest: Feather RP2350 Board Def](https://adafruit-playground.com/u/SamBlenny/pages/zephyr-quest-feather-rp2350-board-def)
playground guide, which explains how to make a custom Zephyr board definition
for the Adafruit Feather RP2350.


## Getting OpenOCD for RP2350

To use the Raspberry Pi Debug Probe for RP2350 based boards with an SWD debug
port, you need the `targets/rp2350.cfg` openocd configuration file. Currently
(Feb 9, 2025), openocd from Debian 12 and the Zephyr SDK 0.17.0 don't include
the config file. You can get a copy by cloning the Raspberry Pi openocd fork
into your Zephyr workspace like this:

```
$ cd ~/code/zephyr-workspace
$ git clone https://github.com/raspberrypi/openocd.git
$ ls openocd/tcl/target/rp2350*
openocd/tcl/target/rp2350.cfg
openocd/tcl/target/rp2350-dbgkey-nonsecure.cfg
openocd/tcl/target/rp2350-dbgkey-secure.cfg
openocd/tcl/target/rp2350-rescue.cfg
openocd/tcl/target/rp2350-riscv.cfg
$
```


## License & Copying

Files in this repo are dual licensed as **"Apache-2.0 OR MIT"** unless marked
otherwise (check SPDX header comments).

This repo is meant to function as a box of spare parts to copy and paste into
other projects.

The dual license with "OR" is intended to make it easier for you to re-use this
example code in existing projects that require one license or the other. If you
want to pick just one of the licenses, it's fine to remove the other license
from the SPDX License Identifier header in your copy of the code.
