#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/Sangarya/izin/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
echo Installing Websocket-SSH AUTOSCRIPT BY GEO
sleep 1
echo Cek Hak Akses...
sleep 0.5
cd
cd /etc/systemd/system/

#Install system auto run
wget -O /etc/systemd/system/ws-ssh.service https://raw.githubusercontent.com/Sangarya/test/main/ws-ssh.service && chmod +x /etc/systemd/system/ws-ssh.service
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/Sangarya/test/main/ws-dropbear.service && chmod +x /etc/systemd/system/ws-dropbear.service
wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/Sangarya/test/main/ws-ovpn.service && chmod +x /etc/systemd/system/ws-ovpn.service
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/Sangarya/test/main/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service

#Install Websocket-SSH
wget -O /usr/local/bin/ws-ssh https://raw.githubusercontent.com/Sangarya/test/main/ws-openssh.py && chmod +x /usr/local/bin/ws-ssh
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/Sangarya/test/main/ws-dropbear.py && chmod +x /usr/local/bin/ws-dropbear
wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/Sangarya/test/main/ws-ovpn.py && chmod +x /usr/local/bin/ws-ovpn
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/Sangarya/test/main/ws-tls.py && chmod +x /usr/local/bin/ws-stunnel

#Enable, Start & Restart ws-ssh service
systemctl enable ws-ssh.service
systemctl start ws-ssh.service
systemctl restart ws-ssh.service

#Enable, Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable, Start & Restart ws-ovpn service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl restart ws-ovpn.service

#Enable, Start & Restart ws-stunnel service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service
