#!/bin/bash

compare_to="$1"

while read pack; do
		package="$pack"
		hostname="$(echo $HOSTNAME)"
		grep_res="$(grep -x ${package} ~/private_files/yaylist_${hostname}.txt)"
		if [ "$package" = "$grep_res" ];then
				echo "" > /dev/null
		else
				echo "$package"
		fi
done <~/private_files/yaylist_${compare_to}.txt
