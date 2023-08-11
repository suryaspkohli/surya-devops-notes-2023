#!/bin/bash
    wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
    sudo tar -xzf postman.tar.gz -C /opt
    rm postman.tar.gz
    sudo ln -s /opt/Postman/Postman /usr/bin/postman

    yum install libXScrnSaver-1.2.2-6.1.el7.x86_64

    cp /opt/files/postman.desktop //usr/share/applications
