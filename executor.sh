#!/bin/bash
BASEDIR=$(pwd)
LOG=$BASEDIR/time.log
LOG2=$BASEDIR/time2.log
START=$(date +%s)
END=$(date +%s)
DIFF=$((END-START))
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Starting to execute: $line"
    START=$(date +%s)
    echo "Executing: $line" >> $LOG
    eval $line >> $LOG 2>&1
    END=$(date +%s)
    DIFF=$((END-START))
    echo "Started: $START ; Finished: $END ; Duration: $DIFF ; Command: $line"
    echo "Started: $START ; Finished: $END ; Duration: $DIFF ; Command: $line" >> $LOG2
    sleep 2
done < "$1"
