#!/bin/bash
ssh $(grep "Host " ~/.ssh/config | awk '{print $2}' | dmenu -c -l 10) 
