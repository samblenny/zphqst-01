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

Until RP2350 support makes it into the upstream OpenOCD and downstream distro
packages, flashing an RP2350 board with the Raspberry Pi Debug Probe requires
using the Raspberry Pi fork of OpenOCD.

You can git clone and build the Raspberry Pi openocd like this (check openocd
README file for more details):

```
$ sudo apt install make libtool pkg-config \
    autoconf automake texinfo libusb-1.0-0-dev libhidapi-dev
$ cd ~/code/zephyr-workspace
$ git clone https://github.com/raspberrypi/openocd.git
$ cd openocd
$ ./bootstrap
$ ./configure --prefix=$(pwd)/build
$ make
$ make install
```

Those commands will put your new openocd binary in:
```
~/code/zephyr-workspace/openocd/build/bin/openocd
```

To make sure that `west flash` uses the correct openocd binary, you will need
to set the `OPENOCD` cmake variable when you do `west build`. For example, you
could put a `set(OPENOCD ...)` in CMakeLists.txt or do something like:
```
(.venv) $ cd ~/code/zephyr-workspace/zphqst-01
(.venv) $ west build ... -- -DOPENOCD=../openocd/build/bin/openocd
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
