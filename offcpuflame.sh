#!/bin/bash
STAP_LIB="-d /opt/openjdk7/lib/amd64/server/libjvm.so  -d /lib/x86_64-linux-gnu/libc.so.6 -d /lib/x86_64-linux-gnu/libpthread-2.19.so -d /opt/openjdk7/lib/amd64/libnet.so"
stap -v -D MAXTRACE=100 -D MAXSTRINGLEN=512 -D MAXMAPENTRIES=100  $STAP_LIB -D MAXACTION=20000 -D STP_OVERLOAD_THRESHOLD=5000000000 --all-modules offcpuflame.stap -x $1 > out.stap-stacks
stackcollapse-stap.pl out.stap-stacks > out.stap-folded
cat out.stap-folded | flamegraph.pl > $2

