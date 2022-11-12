#!/bin/bash

mkdir /var/fedorabackups
cp -r /etc/dovecot/* /var/fedorabackups
cp -r /etc/dovecot/conf.d/* /var/fedorabackups

cp -r /etc/postfix/* /var/fedorabackups

cp -r /etc/chrony.* /var/fedorabackups
