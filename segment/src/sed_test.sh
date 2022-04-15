#!/bin/bash


FILE2=/tmp/sed_test_02.txt
cat <<EOF > ${FILE2}
offset 1111 message type RECORD_TICK size 88888
Tick for symbol BOND.1-1005|MIXFILTER  descriptor id 1 timestamp_sec 159358990u8 timestamp usec 12344
STATE__LASTOBSBMSPD     nan
STATE__LASTOBSBEROR     -1.000000
STATE__NBUY             2
STATE__NSELL            3
__INSTANCE              SINGLE_BOND_MIXFILTER_STAGING
STATE__ATHENAID         BOND.1-1005
STATE__LASTUPD          2020-07-01 06:43:16
OMDSEQ 0
offset 9999 message type RECORD_TICK size 88888
Tick for symbol BOND.1-100A|MIXFILTER  descriptor id 1 timestamp_sec 159358990u8 timestamp usec 12344
STATE__LASTOBSBMSPD     nan
STATE__LASTOBSBEROR     -1.000000
STATE__NBUY             2
STATE__NSELL            3
__INSTANCE              SINGLE_BOND_MIXFILTER_STAGING
STATE__ATHENAID         BOND.1-100A
STATE__LASTUPD          2020-07-01 06:43:23
OMDSEQ 1
EOF
sed -n 'H;:a /^OMDSEQ/{x;s/\n/,/g;p;n;h;b a}' < ${FILE2} 

FILE3=/tmp/sed_test_03.txt
cat <<EOF > ${FILE3}
HEADER 1:
server1 server2 server3
server4 server5 server6
server7 server8 server9
HEADER 2:

HEADER 1:
server10 server11 server12
server13 server14 server15
server16 server17 server18
HEADER 2:
EOF


FILE1=/tmp/sed_test_01.txt
cat <<EOF > ${FILE1}
    read 001 TABLE_PREFIX.XYZ.TBL1 blabber joe peter
        field1: ab1
        field2: ab2
        field3: ab3
        field4: ab4

    read 002 TABLE_PREFIX.WXY.TBL2 x7f7& wuowo mary jones
        field1: XY1
        field2: XY2
        field3: XY3
        field4: XY4

EOF


FILE4=/tmp/sed_test_04.txt
cat <<EOF > ${FILE4}
20120924|<?xml record 1 line1....record 1 line1....record 1 line1....
record 1 line2....record 1 line2....record 1 line2....
record 1 line3....record 1 line3....</dmm>
20120924|<?xml record 2 line1....record 2 line1....record 2 line1....
record 2 line2....record 2 line2....</dmm>
20120924|<?xml record 3 line1....record 3 line1
record 3 line2
record 3 line3....record 3 line3
record 3 line4....record 3 line4....record 3 line4....</dmm>
EOF
# sed -n 'H;:a /<\/dmm>$/{x;s/\n//g;p;n;h;b a}' < ${FILE4} 

# sed '/./{H;$!d} ; x ; s/REGEXP/REPLACEMENT/'

# sed -n: silient 
# sed -E '/^$/p;n;/read/h' ${FILE1}
# sed -E '/.+read.+/{H;:l;/^$/b;P; bl}' ${FILE1}
# sed -n 'H;:a /<\/dmm>$/{x;s/\n//g;p;n;h;b a}' < ${FILE4}  # https://www.unix.com/unix-for-dummies-questions-and-answers/202005-join-lines-until-next-pattern-match.html
# sed -n '/./{H;$!d} ; x ; s/^/\nSTART-->/ ; s/$/\n<--END/' ${FILE}


# b:  branch (break without lable)
# Dd: deletes line from the pattern space until the first newline, and restarts the cycle.
# Gg: appends line from the hold space to the pattern space, with a newline before it.
# Hh: appends line from the pattern space to the hold space, with a newline before it.
# Ll: command prints the content of the pattern space unambiguously
# N:  adds (appends) lines to buffer (preserving newlines)
# n:  skips/prints the current line (HEADER 1), clears buffer 
# Pp: prints line from the pattern space until the first newline.



# seq 6 # | sed -n 'N;l;D'
# 1\n2$
# 2\n3$
# 3\n4$
# 4\n5$
# 5\n6$

