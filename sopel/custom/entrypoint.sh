#!/bin/sh

PIDFILE=$HOME/.sopel/sopel.pid
if [ -f $PIDFILE ];then
    rm $PIDFILE
fi

sopel