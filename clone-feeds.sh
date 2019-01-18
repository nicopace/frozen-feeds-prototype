#!/bin/bash

feeds_dir=feeds/

while read feed; do
    echo "$feed" | grep -q ^src-git || continue
    name="$(echo $feed | awk '{print $2}')"
    full_url="$(echo $feed | awk '{print $3}')"
    [ -d $feeds_dir/$name ] && rm -rf $feeds_dir/$name
    if echo "$full_url" | grep \;; then
        url="$(echo $full_url | awk -F\; '{print $1}')"
        branch="$(echo $full_url | awk -F\; '{print $2}')"
        git clone $url -b $branch $feeds_dir/$name
    elif echo "$full_url" | grep \^; then
        url="$(echo $full_url | awk -F\^ '{print $1}')"
        commit="$(echo $full_url | awk -F\^ '{print $2}')"
        git clone $url $feeds_dir/$name
        ( cd $feeds_dir/$name && git checkout $commit )
    fi
    echo "src-link $name $PWD/$feeds_dir/$name" | tee -a $feeds_file
done < ./feeds.conf
