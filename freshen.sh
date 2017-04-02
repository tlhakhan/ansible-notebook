#!/bin/bash

BASEDIR=$(dirname $BASH_SOURCE)
find $BASEDIR -name *.retry | xargs -n1 rm -f
