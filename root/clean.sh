#!/bin/sh -x
#
# FreeBSD src cleaning script.
#
# (c) 2017, maxohm [ at ] gmail.com
#
chflags -R noschg /usr/obj
rm -rfd /usr/obj/*
make cleandir
make cleandir