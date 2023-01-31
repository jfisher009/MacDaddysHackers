#!/bin/bash
# Check if Splunk is installed
if [ -f "/opt/splunkforwarder/bin/splunk" ]; then
    echo "[$(date +%H:%M:%S)]: Splunk is already installed"
  else
    echo "[$(date +%H:%M:%S)]: Splunk is NOT installed"
fi
