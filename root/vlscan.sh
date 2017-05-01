#!/bin/csh
#

# demoloop.csh - Sample loop script
set j = 1
while ( $j <= 2000 )
  echo "Welcome $j times"
  tcpdump -vvni bge0 vlan $j & 
  @ j++
end

