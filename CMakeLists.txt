# SPDX-License-Identifier: Apache-2.0 OR MIT
# SPDX-FileCopyrightText: Copyright 2025 Sam Blenny
#
# This is a CMake build configuration file where you can use the normal set of
# CMake commands and variables.
#
# Useful CMake documentation links:
# - https://cmake.org/cmake/help/latest/manual/cmake-commands.7.html
# - https://cmake.org/cmake/help/latest/command/set.html
# - https://cmake.org/cmake/help/latest/command/message.html
# - https://cmake.org/cmake/help/latest/variable/PROJECT_SOURCE_DIR.html
# 


# These next two lines are required by CMake
cmake_minimum_required(VERSION 3.20)
project(zphqst-01)

# This part tells west where to find the system package for OpenOCD. After you
# do `sudo apt install openocd` on Debian 12, there will be a good build of
# openocd that knows where to find the Raspberry Pi Debug Probe config file.
# If you try to use the version of openocd that comes with the Zephyr SDK, you
# will likely get errors about openocd not finding the right config file.
#
# WARNING: If you don't have OpenOCD installed at /usr/bin/openocd, this next
# line won't work. On Linux, you can use `which openocd` to locate the path
# to your openocd binary, if you have one installed.
#
set(OPENOCD /usr/bin/openocd)
message(STATUS "Looking for OpenOCD at: ${OPENOCD}")

# This makes sure that `west build -b ...` will look for boards in ./boards
set(BOARD_ROOT ${PROJECT_SOURCE_DIR})
message(STATUS "Looking for custom boards in: ${PROJECT_SOURCE_DIR}")

find_package(Zephyr)
target_sources(app PRIVATE src/main.c)
