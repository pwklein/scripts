#!/bin/bash
thunar $(find -type d | dmenu -i -p "Directories: " -c -l 10)
