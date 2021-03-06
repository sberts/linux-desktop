#!/bin/bash

echo starting $(date) >> /tmp/startup.log

apt update && apt upgrade -y && apt install ansible -y && \
  ansible-pull -U https://github.com/sberts/linux-desktop.git

mkdir /data
if ! mount /dev/vdb /data; then
  mkfs.ext4 /dev/vdb
  mount /dev/vdb /data
fi

echo finished $(date) >> /tmp/startup.log
