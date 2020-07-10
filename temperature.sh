#!/bin/bash
echo $(sensors | grep Tdie | awk '{print $2}')
