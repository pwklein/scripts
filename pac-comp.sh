#!/bin/bash

compare_to="$1"

while read pack; do
		package="$pack"
		hostname="$(echo $HOSTNAME)"
		grep_res="$(cat ~/private_files/paclist_${hostname}.txt | grep ${package})"

		if [ "$package" = "$grep_res" ];then
				echo "" > /dev/null
		else
				echo "$package"
		fi
done <~/private_files/paclist_${compare_to}.txt


