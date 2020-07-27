#!/bin/bash
jupyter notebook stop $(jupyter notebook list | dmenu\
	-i -c -l 10 |  grep -o -P '(?<=localhost:).*(?=/?token)' | cut -c1-4)
