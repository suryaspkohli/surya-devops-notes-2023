#!/bin/bash

echo " installing forti-client vpn in your system "
 yum remove forticlient -y 
 yum-config-manager --add-repo https://repo.fortinet.com/repo/7.0/centos/8/os/x86_64/fortinet.repo
 yum install forticlient -y
echo " installtion is complete please configure the vpn detail in your vpn " 


