#!/bin/sh -x
#
# PF TABLES SORT SCRIPT - MODEL I
# (c) maxohm [ at ] gmail.com
#
dname=`which dirname`
home=`$dname $0`
#
own="`which chown` -fR 0:0"
mod="`which chmod` -f"
#
tr="`which tr` -d"
sort="`which sort` -bui"
mv="`which mv` -f"
ln="`which ln` -f -s"
#
pf=`which pfctl`
#
# PERMISSIONS FIX
#
$own $home
$mod 0640 $home/*
$mod 0740 $home
$mod 0740 $home/*.sh
#
# SORT => SYNC
#
$tr ' ' < $home/black.in.src | $sort > $home/black.in.src.sorted
$mv $home/black.in.src.sorted $home/black.in.src
#
$tr ' ' < $home/nat.dst | $sort > $home/nat.dst.sorted
$mv $home/nat.dst.sorted $home/nat.dst
#
# RELOAD => LOG
#
$pf -o basic -FT -f$home/pf.conf.$1 -D eif=$1
$pf -sa >/var/log/pf.$1.log
$ln /var/log/pf.$1.log /var/log/pf.log
#
