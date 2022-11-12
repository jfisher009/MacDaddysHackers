#!/bin/bash

mkdir /etc/backups/
mkdir /etc/backups/dovecot
mkdir /etc/backups/dovecot/conf.d

cp /etc/dovecot/* /etc/backups/dovecot
cp /etc/dovecot/conf.d/* /etc/backups/dovecot/conf.d


mkdir /etc/backups/postfix
cp /etc/postfix/* /etc/backups/postfix

mkdir /etc/backups/chronyd
cp /etc/chrony.* /etc/backups/chronyd
