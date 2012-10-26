#!/bin/bash
set -e -x
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get upgrade -y

apt-get install -y wget

local version=1.2.1-1_i386
wget http://downloads.basho.com.s3-website-us-east-1.amazonaws.com/riak/CURRENT/ubuntu/lucid/riak_${version}.deb
dpkg -i riak_${version}.deb

sudo wget "https://riak-cluster-chef.s3.amazonaws.com/app.config"
sudo wget "https://riak-cluster-chef.s3.amazonaws.com/vm.args"

cat app.config > /etc/riak/app.config
cat vm.args > /etc/riak/vm.args

riak start

