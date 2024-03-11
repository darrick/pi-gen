#!/bin/bash -e

mysql -e "create database Rivendell;"
mysql -e "grant Select, Insert, Update, Delete, Create, Drop, References, Index, Alter, Create Temporary Tables, Lock Tables on Rivendell.* to rduser@'%' identified by 'hackme'"
rddbmgr --create --generate-audio

echo "UPDATE STATIONS set START_JACK='Y', JACK_COMMAND_LINE='/usr/bin/jackd --name default -d dummy -r 48000' WHERE NAME='$HOSTNAME';" | mysql Rivendell
