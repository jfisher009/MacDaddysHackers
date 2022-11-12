#!/bin/bash

mkdir /var/fedorabackups
m
cp /etc/dovecot/* /var/fedorabackups
cp /etc/dovecot/conf.d/* /var/fedorabackups

cp /etc/postfix/* /var/fedorabackups

cp /etc/chrony.* /var/fedorabackups
