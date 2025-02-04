# SPDX-License-Identifier: Apache-2.0 OR MIT
# SPDX-FileCopyrightText: Copyright 2025 Sam Blenny


#_CMAKE_ARGS=-- -DOPENOCD=$$(which openocd)

# Build Zephyr shell for Feather RP2350 with OpenOCD and Pi Debug Probe.
# This depends on CMakeLists.txt setting OPENOCD and BOARD_ROOT correctly. 
shell:
	west build -b feather_rp2350/rp2350a/m33 $(_CMAKE_ARGS)

# Interactively modify config from previous build
menuconfig:
	west build -t menuconfig

# Flash previously built firmware
flash:
	west flash

# Connect to board's serial console using Pi Debug Probe UART interface
uart:
	@screen -fn /dev/serial/by-id/*Pi_Debug* 115200


clean:
	rm -rf build

.PHONY: shell menuconfig flash uart clean
