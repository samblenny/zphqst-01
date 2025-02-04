# SPDX-License-Identifier: Apache-2.0 OR MIT
# SPDX-FileCopyrightText: Copyright 2025 Sam Blenny
#
# This is a CMake build configuration file where you can use the normal set of
# CMake commands and variables.
#
# Useful CMake documentation links:
# - https://cmake.org/cmake/help/latest/manual/cmake-commands.7.html
# - https://cmake.org/cmake/help/latest/command/execute_process.html
# - https://cmake.org/cmake/help/latest/command/message.html
# - https://cmake.org/cmake/help/latest/command/set.html
# - https://cmake.org/cmake/help/latest/command/string.html
# - https://cmake.org/cmake/help/latest/variable/PROJECT_SOURCE_DIR.html
# 


# These next two lines are required by CMake
cmake_minimum_required(VERSION 3.20)
project(zphqst-01)

# This part tells west where to find the system package for OpenOCD. When I
# wrote this, the version of openocd that came with the Zephyr SDK did not know
# how to find the proper config file for using the Raspberry Pi Debug Probe.
# On Debian 12, it works fine to use the system openocd package. This assumes
# that you previously installed a working openocd with your package manager.
#
execute_process(COMMAND bash -c "which openocd" OUTPUT_VARIABLE OPENOCD)
# remove trailing newline
string(STRIP ${OPENOCD} OPENOCD)
message(STATUS "Result of `which openocd`: ${OPENOCD}")

# This makes sure that `west build -b ...` will look for boards in ./boards
set(BOARD_ROOT ${PROJECT_SOURCE_DIR})
message(STATUS "Looking for custom boards in: ${PROJECT_SOURCE_DIR}")

find_package(Zephyr)
target_sources(app PRIVATE src/main.c)
