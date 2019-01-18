#!/bin/bash
set -x

for frozen_feed in `ls frozen-feeds`; do
    cd feeds/$frozen_feed
    ../../freeze-directories.sh ../../frozen-feeds/$frozen_feed
    cd ..
done

