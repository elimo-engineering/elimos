#!/bin/sh

hexnum=$(i2ctransfer -y 0 r2@0x49 | sed "s/ //g" | sed "s/0x//g" | cut -c2-4)
decnum=$(echo $((16#$hexnum)))
let counts=decnum/4
let microvolts=counts*4100
let millivolts=microvolts/1000
#echo ${counts}
echo ${millivolts}

