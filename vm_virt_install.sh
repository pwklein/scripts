sudo virt-install\
		--name harrer\
		--ram=2048\
		--vcpus=1,maxvcpus=2\
		--cpu host\
		--hvm\
		--disk path=/var/lib/libvirt/images/test_vm1,size=20,pool=images\
		--cdrom /var/lib/libvirt/isos/debian10.iso\
		--graphics vnc,port=5901
