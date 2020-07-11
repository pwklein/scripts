#!/bin/bash

virt-clone \
		--original mephisto \
		--name arch \
		--file /var/lib/libvirt/images/arch.qcow2
