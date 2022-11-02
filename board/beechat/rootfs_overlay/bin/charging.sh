#!/bin/sh

# PE16: (position of letter in alphabet - 1) * 32 + pin number
let CHG_GPIO=4*32+16

if [ 0 -eq "$(gpioget gpiochip0 "${CHG_GPIO}")" ]; then
    echo 1
    return 0
else
    echo 0
    return 1
fi
