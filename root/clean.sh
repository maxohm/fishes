#!/bin/sh -x
#
chflags -R noschg /usr/obj
rm -rfd /usr/obj/*
make cleandir
make cleandir