#!/bin/bash

./configure 2 > /dev/null

#********************************
# servers
#********************************
if [ -f /etc/init.d/snmpd ]
then
	echo "TESTING: snmpd (test/root/snmpd.exp)"
	./snmpd.exp
else
	echo "TESTING SKIP: snmpd  not found"
fi


if [ -f /etc/init.d/apache2 ]
then
	echo "TESTING: apache2 (test/root/apache2.exp)"
	./apache2.exp
else
	echo "TESTING SKIP: apache2  not found"
fi

if [ -f /etc/init.d/isc-dhcp-server ]
then
	echo "TESTING: isc dhcp server (test/root/isc-dhscp.exp)"
	./isc-dhcp.exp
else
	echo "TESTING SKIP: isc dhcp server not found"
fi

if [ -f /etc/init.d/unbound ]
then
	echo "TESTING: unbound (test/root/unbound.exp)"
	./unbound.exp
else
	echo "TESTING SKIP: unbound  not found"
fi

if [ -f /etc/init.d/nginx ]
then
	echo "TESTING: nginx (test/root/nginx.exp)"
	./nginx.exp
else
	echo "TESTING SKIP: nginx  not found"
fi

#********************************
# seccomp
#********************************
echo "TESTING: seccomp umount (test/root/seccomp-umount.exp)"
./seccomp-umount.exp

echo "TESTING: seccomp chmod (test/root/seccomp-chmod.exp)"
./seccomp-chmod.exp

echo "TESTING: seccomp chown (test/root/seccomp-chown.exp)"
./seccomp-chown.exp

#********************************
# command line options
#********************************
echo "TESTING: tmpfs (test/root/option_tmpfs.exp)"
./option_tmpfs.exp

echo "TESTING: profile tmpfs (test/root/profile_tmpfs)"
./profile_tmpfs.exp

echo "TESTING: bind directory (test/root/option_bind_directory.exp)"
./option_bind_directory.exp

echo "TESTING: bind file (test/root/option_bind_file.exp)"
echo hello > tmpfile
./option_bind_file.exp
rm -f tmpfile

#********************************
# networking
#********************************
echo "TESTING: network interfaces (test/root/net_interface.exp)"
./net_interface.exp

echo "TESTING: firemon --interface (test/root/firemon-interface.exp)"
./firemon-interface.exp

#if [ -f /sys/fs/cgroup/g1/tasks ]
#then
#	echo "TESTING: firemon --cgroup (firemon-cgroup.exp)"
#	./firemon-cgroup.exp
#fi
#
#echo "TESTING: chroot resolv.conf (chroot-resolvconf.exp)"
#rm -f tmpfile
#touch tmpfile
#rm -f /tmp/chroot/etc/resolv.conf
#ln -s tmp /tmp/chroot/etc/resolv.conf
#./chroot-resolvconf.exp
#rm -f tmpfile
#rm /tmp/chroot/etc/resolv.conf

#echo "TESTING: chroot (fs_chroot_asroot.exp)"
#./fs_chroot_asroot.exp


