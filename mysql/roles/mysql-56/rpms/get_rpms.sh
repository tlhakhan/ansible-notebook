#!/bin/bash

BASEDIR=$(dirname $BASH_SOURCE)
MYSQL_VERSION=5.6

# get rpms
cp -Rav /opt/software/mysql/$MYSQL_VERSION/*.rpm $BASEDIR 
