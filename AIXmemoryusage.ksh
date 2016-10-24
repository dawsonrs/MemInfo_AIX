#!/usr/bin/ksh
#
# Quick view of memory usage under AIX
#
# e.g. 
# dawsonr@AIX > ./meminfo
# 
# Memory Information
# ==================
# total memory = 1884 MB
# free memory  = 94 MB
# used memory  = 1790 MB

 
USED=`svmon -G | head -2 | tail -1 | awk '{ print $3 }'`
USED=`expr $USED / 256`
TOTAL=`lsattr -El sys0 -a realmem | awk '{ print $2 }'`
TOTAL=`expr $TOTAL / 1000`
FREE=`expr $TOTAL - $USED`
 
echo "\nMemory Information"
echo "=================="
echo "total memory = $TOTAL MB"
echo "free memory  = $FREE MB"
echo "used memory  = $USED MB"
 
exit 0

