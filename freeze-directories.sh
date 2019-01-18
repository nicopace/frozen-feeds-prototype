#!/bin/bash

cat $1 | while read -r line; do
    DIRECTORY=`echo $line | cut -d\  -f1`
    COMMIT=`echo $line | cut -d\  -f2`
    git reset $COMMIT -- $DIRECTORY;
done
