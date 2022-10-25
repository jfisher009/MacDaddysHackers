#!/bin/bash

mkdir /etc/escond/
mkdir /etc/escond/dovecot
mkdir /etc/escond/dovecot/conf.d
cp /etc/dovecot/* /etc/escond/dovecot
cp /etc/dovecot/conf.d/* /etc/escond/dovecot/conf.d

mkdir /etc/escond/postfix
cp /etc/postfix/* /etc/escond/postfix

mkdir /etc/escond/chronyd
cp /etc/chrony.* /etc/escond/chronyd
