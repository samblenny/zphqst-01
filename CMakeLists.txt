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
# wrote this, neither the version of openocd that came with the Zephyr SDK or
# the Debian 12 openocd have support for RP2350. To use the Raspberry Pi Debug
# Probe with OpenOCD, you need to use the Raspberry Pi openocd fork. This
# assumes that you built a copy of the Raspberry Pi openocd from git source.
#
set(OPENOCD ${ZEPHYR_BASE}/../openocd/build)
message(STATUS "OPENOCD = ${OPENOCD}")

# This makes sure that `west build -b ...` will look for boards in ./boards
set(BOARD_ROOT ${PROJECT_SOURCE_DIR})
message(STATUS "Looking for custom boards in: ${PROJECT_SOURCE_DIR}")

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
message(WARNING "ZEPHYR_BASE=$ENV{ZEPHYR_BASE}")
target_sources(app PRIVATE src/main.c)
