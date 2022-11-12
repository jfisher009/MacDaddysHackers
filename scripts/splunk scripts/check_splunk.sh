#!/bin/bash
# Check if Splunk is installed
if [ -f "/opt/splunk/bin/splunk" ]; then
    echo "[$(date +%H:%M:%S)]: Splunk is already installed in /opt/splunk/bin"
  else
    echo "[$(date +%H:%M:%S)]: Splunk is NOT installed"
if [ -f "/opt/splunkforwarder/bin/splunk" ]; then
    echo "[$(date +%H:%M:%S)]: Splunk forwarder is already installed"
fi
