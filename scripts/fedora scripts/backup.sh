#!/bin/bash

mkdir /etc/backups/
mkdir /etc/backups/dovecot
mkdir /etc/backups/dovecot/conf.d

cp -ra /etc/dovecot/* /etc/backups/dovecot
cp -ra /etc/dovecot/conf.d/* /etc/backups/dovecot/conf.d


mkdir /etc/backups/postfix
cp -ra /etc/postfix/* /etc/backups/postfix

mkdir /etc/backups/chronyd
cp -ra /etc/chrony.* /etc/backups/chronyd
