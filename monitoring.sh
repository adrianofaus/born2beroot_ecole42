#!/bin/bash

arch=$(uname -a)
pcpu=$(nproc)
vcpu=$(more /proc/cpuinfo | grep processor | wc -l)
memu=$(free -m | awk 'NR==2 {printf "%d/%dMB (%.2f%%)\n" , $3, $2, ($3/$2)*100}')
dsku=$(df -h | awk '$NF=="-" {printf "%d/%dGb (%s)", $3, $2, $5}')
cpul=$(mpstat | grep all | awk '{printf("%s%%", 100 - $13)}')
lboo=$(who -b | cut -d " " -f12-)
lvmu=$(lsblk | grep "lvm" | awk '{if($1){printf "yes"; exit;} else {prntf "no";}}')
ctcp=$(netstat -an | grep "ESTABLISHED" | wc -l | awk '{if ($1 > 0) {printf "%d ESTABILISHED\n", $1; exit;} else {printf "no";}}')
ulog=$(who | cut -d " " -f 1 | sort -u | wc -l)
ipv4=$(hostname -I | awk '{printf "%s ", $1}')
amac=$(ip a | grep "link/ether" | awk '{printf $2}')
sudo=$(cat /var/log/sudo/sudo.log | grep -a "COMMAND" | wc -l)

wall "\
#Architecture: $arch
#CPU physical: $pcpu
#vCPU: $vcpu
#Memory Usage: $memu
#Disk Usage: $dsku
#CPU load: $cpul
#Last boot: $lboo
#LVM Use: $lvmu
#Connexions TCP: $ctcp
#User log: $ulog
#Network: IP $ipv4 ($amac)
#Sudo: $sudo cmd"
