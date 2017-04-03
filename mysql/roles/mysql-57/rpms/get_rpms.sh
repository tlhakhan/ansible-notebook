#!/bin/bash

BASEDIR=$(dirname $BASH_SOURCE)
MYSQL_VERSION=5.7

# get rpms
cp -Rav /opt/software/mysql/$MYSQL_VERSION/*.rpm $BASEDIR 
