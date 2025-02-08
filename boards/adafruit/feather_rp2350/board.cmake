# CAUTION: For this to work, you will need the target/rp2350.cfg for OpenOCD
# which is only available in very recent versions. You can get the file at
# https://github.com/raspberrypi/openocd/blob/sdk-2.0.0/tcl/target/rp2350.cfg

# Just use the normal Raspberry Pi Pico 2 config
include(${ZEPHYR_BASE}/boards/raspberrypi/rpi_pico2/board.cmake)
