# SPDX-License-Identifier: Apache-2.0 OR MIT
# SPDX-FileCopyrightText: Copyright 2025 Sam Blenny

# CAUTION: Using OpenOCD with the RP2350 requires a recent version of openocd
# with RP2350 support. At the time I'm writing this, (Feb 9, 2025), you need to
# build the Raspberry Pi openocd fork from source. You will also need to be
# sure that the west OPENOCD cmake variable gets set correctly in a
# board.cmake, CMakeLists.txt, or command line argument.


# Uncomment the next line if you want extra debug info from cmake
#_CMAKE_ECHO=-DCMAKE_EXECUTE_PROCESS_COMMAND_ECHO=STDERR
_OPENOCD=-DOPENOCD=../openocd/build/bin/openocd

# Build Zephyr shell for Feather RP2350 with OpenOCD and Pi Debug Probe.
# This depends on CMakeLists.txt setting OPENOCD and BOARD_ROOT correctly. 
shell:
	west build -b feather_rp2350/rp2350a/m33 -- ${_OPENOCD} ${_CMAKE_ECHO}

# Build the zephyr repo's hello_world sample
hello_world:
	west build -b feather_rp2350/rp2350a/m33 ../zephyr/samples/hello_world \
		-- -DBOARD_ROOT=$$(pwd) ${_OPENOCD} ${_CMAKE_ECHO}

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

# If west build chokes on the dts file, it will give an uninformative numeric
# error code instead of dtc's stderr/stdout. But, it does leave behind a
# build/zephyr/zephyr.dts file with the preprocessed and merged output of all
# the various dts files. In zephyr/cmake/modules/dts.cmake, on about line 404,
# there is an `execute_process(COMMAND ${DTC} ...)` command. If you edit that
# command to include the ECHO_OUTPUT_VARIABLE and ECHO_ERROR_VARIABLE args, it
# will echo dtc's error message explaining what went wrong. You can also do
# `west build ... -- -DCMAKE_EXECUTE_PROCESS_COMMAND_ECHO=STDERR` to see the
# command cmake uses to invoke dtc. (that's where the invocation below came
# from)
dtc:
	@dtc -O dts -o - -b 0 -E unit_address_vs_reg \
		-Wno-unique_unit_address                 \
		-Wunique_unit_address_if_enabled         \
		build/zephyr/zephyr.dts

.PHONY: shell hello_world menuconfig flash uart clean dtc
