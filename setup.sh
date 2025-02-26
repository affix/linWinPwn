#!/bin/bash
#
# Author: lefayjey
#

RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]
    then echo -e "\n${RED}[Error]${NC} Please run with sudo or as root"
    exit
fi

install_tools() {
    apt install python3 python3-dev python3-pip python3-venv nmap smbmap john git seclists -y
    
    python3 -m pip install --upgrade pip
    
    pip3 install impacket bloodhound crackmapexec ldapdomaindump lsassy kerbrute certipy \
    git+https://github.com/dirkjanm/adidnsdump#egg=adidnsdump git+https://github.com/zer1t0/certi.git --upgrade
    
	echo -e "\tgMSADumper"
	wget -q "https://raw.githubusercontent.com/micahvandeusen/gMSADumper/main/gMSADumper.py" -O ./gMSADumper.py
	echo -e "\tLdapRelayScan"
	wget -q "https://raw.githubusercontent.com/zyn3rgy/LdapRelayScan/main/LdapRelayScan.py" -O ./LdapRelayScan.py
}

install_tools || { echo -e "\n${RED}[Failure]${NC} Intalling tools failed.. exiting script!\n"; exit 1; }

echo -e "\n${GREEN}[Success]${NC} Setup completed successfully!\n"