#!/bin/bash

HEADER_COUNT=1
IS_FIRST_LINE=1
IS_REASON=1
function PARSE_SRS {
if [ $1 == "MAILER-DAEMON" ]
then
echo $1
else
ADDR=$(echo $1 | rev | cut -d"@" -f2 | rev)
ADDR=$(echo $ADDR | rev | cut -d"=" -f1 | rev)
DOMAIN=$(echo $1 | rev | cut -d"=" -f2 | rev)
echo $ADDR@$DOMAIN
fi
}

DEBUG=0
function DEBLOG {
    if [ $DEBUG -eq 1 ]
    then
echo mark: $1
echo ----------------------------
echo IS_FIRST_LINE=$IS_FIRST_LINE
echo ID=$ID
echo T=$T
echo DAYW=$DAYW
echo MONTH=$MONTH
echo DAY=$DAY
echo TIME=$TIME
echo SENDER=$SENDER
echo IS_REASON=$IS_REASON
echo REASON=$REASON
echo RECEIVER=$RECEIVER
echo ----------------------------
    fi
}


ID=0
T=1
DAYW=2
MONTH=3
DAY=4
TIME=5
SENDER=6


while read line
do
    if [ $HEADER_COUNT -gt 0 ] 
    then
        HEADER_COUNT=$(( HEADER_COUNT-1 ))
        continue
    fi
    echo - $line
    
    if [ -z "$line" ]
    then
        echo $ID $SENDER from: $RECEIVER $REASON [$DAYW $MONTH $DAY $TIME]
        IS_FIRST_LINE=1
        continue
    fi

    if [ $IS_FIRST_LINE -eq 1 ]
    then
        arr=($line) 
        ID=${arr[0]}
        T=${arr[1]}
        DAYW=${arr[2]}
        MONTH=${arr[3]}
        DAY=${arr[4]}
        TIME=${arr[5]}
        SENDER=${arr[6]}
        SENDER=$(PARSE_SRS $SENDER)
        IS_FIRST_LINE=0
        DEBLOG firstline
    elif [ $IS_REASON -eq 1 ]
    then
        REASON=$(echo $line | rev | cut -d":" -f1 | rev)
        IS_REASON=0
        DEBLOG reason
    else
        RECEIVER=$line
        IS_REASON=1
        DEBLOG receiver
    fi
   
done < "${1:-/dev/stdin}"
