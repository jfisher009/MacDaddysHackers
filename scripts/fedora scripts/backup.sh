#!/bin/bash

mkdir /etc/backups/
mkdir /etc/backups/dovecot
mkdir /etc/backups/dovecot/conf.d

cp -r /etc/dovecot/* /etc/backups/dovecot
cp -r /etc/dovecot/conf.d/* /etc/backups/dovecot/conf.d


mkdir /etc/backups/postfix
cp -r /etc/postfix/* /etc/backups/postfix

mkdir /etc/backups/chronyd
cp -r /etc/chrony.* /etc/backups/chronyd
