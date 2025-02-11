# SPDX-License-Identifier: Apache-2.0 OR MIT
# SPDX-FileCopyrightText: Copyright 2025 Sam Blenny

# CAUTION: For this to work, you will need the Raspberry Pi fork of openocd,
# including the openocd binary and the target/rp2350.cfg config file. At the
# time I'm writing this (Feb 9, 2025), upstream openocd does not yet support
# the RP2350. To get openocd, you can do:
#
#     $ cd ~/code/zephyr-workspace
#     $ git clone https://github.com/raspberrypi/openocd.git
#
board_runner_args(openocd --cmd-pre-init "adapter driver cmsis-dap")
board_runner_args(openocd --cmd-pre-init "adapter speed 5000")
board_runner_args(openocd --cmd-pre-init "source [find target/rp2350.cfg]")
include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
