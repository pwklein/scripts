#!/bin/bash

virt-clone \
		--original arch \
		--name $1 \
		--file /var/lib/libvirt/images/$(echo $1).qcow2
