#!/bin/bash
mkdir scripts
cd scripts
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/palo%20scripts/1-make-palo-addresses.txt
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/palo%20scripts/2-make-palo-services.txt
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/palo%20scripts/3-make-palo-service-groups.txt
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/palo%20scripts/4-make-zones.txt
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/palo%20scripts/5-make-simple-policies.txt
cd ..
mkdir templates
cd templates
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/Write%20Up%20Templates/Basic%20Incident%20Response%20-%20Blank.docx
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/Write%20Up%20Templates/Basic%20Memo%20-%20Blank.docx
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/Write%20Up%20Templates/Password%20Policy%20Sample.docx
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/Write%20Up%20Templates/Physical%20Security%20Memo.docx
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/Write%20Up%20Templates/Logon%20Banner.txt
