# Description

This repository is a prototype of a tool that could be used to build a specific set of packages from a set of feeds.

We might need this in order to control the packages we use in our releases, while allowing to easily follow the trunk of mainstream openwrt.

It would also help us to keep sensitive packages, usability updates and security updates up to date.

The script freeze-directories.sh deals with moving certain directories to a specific commit, the one we want to keep.

Those that are not 'frozen' will use the default branch/commit/tag referred in the feeds.conf

The clone-feeds.sh emulates what buildroot does.

freeze-feeds.sh uses freeze-directories to go through each frozen-feeds/<feed-name> and applying them on the respective feed.

