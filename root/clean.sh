#!/bin/sh -x
#
# FreeBSD src tree cleaning
#
# (c) 2019, maxohm [ at ] gmail.com
#
chflags -R noschg /usr/obj
rm -rfd /usr/obj/*
make cleandir
make cleandir
#