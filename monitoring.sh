wall $'#Architecture:' `uname -a`\
$'\n#CPU physical :' `nproc`\
$'\n#vCPU :' `more /proc/cpuinfo | grep processor | wc -l`\
$'\n#Memory Usage: ' `free -m | awk 'NR==2 {printf "%d/%dMB (%.2f%%)\n" , $3, $2, ($3/$2)*100}'`\
$'\n#Disk Usage: ' `df -h | awk '$NF=="/" {printf "%d/%dGb (%s)", $3, $2, $5}'`\
$'\n#CPU load: '`mpstat | grep all | awk '{printf("%s%%", 100 - $13)}'` \
$'\n#Last boot: ' `who -b | cut -d " " -f12-`\
$'\n#LVM Use: ' `lsblk | grep "lvm" | awk '{if($1){printf "yes"; exit;} else {prntf "no";}}'`\
$'\n#Connexions TCP: ' `netstat -an | grep "ESTABLISHED" | wc -l | awk '{if ($1 > 0) {printf "%d ESTABILISHED\n", $1; exit;} else {printf "no";}}'`\
$'\n#User log: ' `who | cut -d " " -f 1 | sort -u | wc -l `\
$'\n#Network: IP ' `hostname -I | awk '{printf "%s ", $1}' `"("`ip a | grep "link/ether" | awk '{print $2}'`")"\
$'\n#Sudo: ' `cat /var/log/sudo/sudo.log | grep -a "COMMAND" | wc -l` 'cmd'
