wget -O splunkforwarder-8.2.3-cd0848707637-Linux-x86_64.tgz 'https://download.splunk.com/products/universalforwarder/releases/8.2.3/linux/splunkforwarder-8.2.3-cd0848707637-Linux-x86_64.tgz'
sudo tar xvzf splunkforwarder-8.2.3-cd0848707637-Linux-x86_64.tgz -C /opt
cd /opt/splunkforwarder/bin
sudo ./splunk start --accept-license 
sudo ./splunk enable boot-start
/opt/splunkforwarder/bin/splunk add forward-server 172.20.241.20:9997
/opt/splunkforwarder/bin/splunk add monitor /var/log/auth.log -index main -sourcetype syslog
/opt/splunkforwarder/bin/splunk add monitor /var/log/apache2/access.log -index main -sourcetype weblog
/opt/splunkforwarder/bin/splunk add monitor /var/log/apache2/error.log -index main -sourcetype weblog
/opt/splunkforwarder/bin/splunk add monitor /var/log/maillog -index main -sourcetype weblog
/opt/splunkforwarder/bin/splunk add monitor /var/log/httpd/error_log -index main -sourcetype weblog
/opt/splunkforwarder/bin/splunk add monitor /var/log/httpd/access_log -index main -sourcetype weblog
/opt/splunkforwarder/bin/splunk add monitor /var/log/secure -index main -sourcetype syslog
/opt/splunkforwarder/bin/splunk add monitor /var/log/messages -index main -sourcetype syslog
/opt/splunkforwarder/bin/splunk add monitor /var/log/httpd-errors.log -index main -sourcetype syslog
/opt/splunkforwarder/bin/splunk add monitor /var/log/yum.log -index main -sourcetype syslog
/opt/splunkforwarder/bin/splunk add monitor /var/log/mysql.err -index main -sourcetype syslog
/opt/splunkforwarder/bin/splunk add monitor /var/log/mariadb/mariadb.log -index main -sourcetype syslog
/opt/splunkforwarder/bin/splunk add monitor /var/log/syslog -index main -sourcetype syslog
/opt/splunkforwarder/bin/splunk add monitor /var/log/boot.log -index main -sourcetype syslog
/opt/splunkforwarder/bin/splunk add monitor /var/adm/sulog -index main -sourcetype syslog
/opt/splunkforwarder/bin/splunk list forward-server
/opt/splunkforwarder/bin/splunk restart
