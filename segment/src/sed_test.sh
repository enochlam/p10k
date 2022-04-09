#!/bin/bash

FILE=/tmp/sed_test_01.txt
cat <<EOF > ${FILE}
    read 001 TABLE_PREFIX.XYZ.TBL1 blabber joe peter
        field1: abc
        field2: abc
        field3: abc
        field4: abc

    read 002 TABLE_PREFIX.WXY.TBL2 x7f7& blabber joe peter
        field1: XYZ
        field2: XYZ
        field3: XYZ
        field4: XYZ
EOF

# sed '/./{H;$!d} ; x ; s/REGEXP/REPLACEMENT/'

# sed -n: silient 
sed -n '/./{H;$!d} ; x ; l' ${FILE}
# sed -n '/./{H;$!d} ; x ; s/^/\nSTART-->/ ; s/$/\n<--END/' ${FILE}


# Dd: deletes line from the pattern space until the first newline, and restarts the cycle.
# Gg: appends line from the hold space to the pattern space, with a newline before it.
# Hh: appends line from the pattern space to the hold space, with a newline before it.
# Ll: command prints the content of the pattern space unambiguously
# Nn: appends line from the input file to the pattern space.
# Pp: prints line from the pattern space until the first newline.



# seq 6 # | sed -n 'N;l;D'
# 1\n2$
# 2\n3$
# 3\n4$
# 4\n5$
# 5\n6$

