#!/bin/bash

sudo reflector --country France --country Germany --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

