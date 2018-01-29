#!/bin/bash

BASEDIR=$(dirname $BASH_SOURCE)

# mysql catalog
MYSQL_VERSIONS=( 5.6.39 5.7.21 )
MYSQL_VERSION_URLS=( "https://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-5.6.39-1.el7.x86_64.rpm-bundle.tar" "https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.21-1.el7.x86_64.rpm-bundle.tar" )

# get rpm bundle
for i in ${!MYSQL_VERSIONS[@]}
do
    # makes sure that file rpm bundle tar doesn't already exist, otherwise download bundle
    # make sure that the version folder exists, otherwise create
    # untar the bundle into respective version folder
    [[ -e $BASEDIR/$(basename ${MYSQL_VERSION_URLS[i]}) ]] || curl -s -LO ${MYSQL_VERSION_URLS[i]}
    [[ -d $BASEDIR/${MYSQL_VERSIONS[i]} ]] || mkdir $BASEDIR/${MYSQL_VERSIONS[i]}
    tar -xvf $(basename ${MYSQL_VERSION_URLS[i]}) -C $BASEDIR/${MYSQL_VERSIONS[i]}
done
