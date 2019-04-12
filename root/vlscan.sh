#!/bin/sh
#
# specialized
#
# (c) 2019, maxohm [ at ] gmail.com
#
set j = 1
while ( $j <= 2000 )
  #echo "Welcome $j times"
  tcpdump -vvni $0 vlan $j &
  @ j++
end
#