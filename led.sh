#!/usr/bin/env bash

# Initializing the RGB LED

# RED LED pin = GPIO17
# GREEN LED pin = GPIO22
# BLUE LED pin = GPIO27

function red_led_init {
             if [ ! -f /sys/class/gpio/gpio17/direction ] ; then
                echo  "17" > /sys/class/gpio/export
             fi
             echo "out" > /sys/class/gpio/gpio17/direction
         }

function red_led_on {
             echo "0" > /sys/class/gpio/gpio17/value
         }

function red_led_off {
             echo "1" > /sys/class/gpio/gpio17/value
         }

function green_led_init {
             if [ ! -f /sys/class/gpio/gpio22/direction ] ; then
                echo  "22" > /sys/class/gpio/export
             fi
             echo "out" > /sys/class/gpio/gpio22/direction
         }

function green_led_on {
             echo "0" > /sys/class/gpio/gpio22/value
         }

function green_led_off {
             echo "1" > /sys/class/gpio/gpio22/value
         }

function blue_led_init {
             if [ ! -f /sys/class/gpio/gpio27/direction ] ; then
                echo  "27" > /sys/class/gpio/export
             fi
             echo "out" > /sys/class/gpio/gpio27/direction
         }

function blue_led_on {
             echo "0" > /sys/class/gpio/gpio27/value
         }

function blue_led_off {
             echo "1" > /sys/class/gpio/gpio27/value
         }


green_led_init
green_led_off

blue_led_init
blue_led_off

red_led_init
red_led_off

sleep 1

green_led_on
sleep 1
green_led_off
sleep 1

blue_led_on
sleep 1
blue_led_off
sleep 1

red_led_on
sleep 1
red_led_off
sleep 1
