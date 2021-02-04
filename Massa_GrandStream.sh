#!/bin/bash

SENHA=$1
ACAO=$2

if [ $# -lt 2 ]; then
   echo "Faltou passar senha e ação a ser tomada (REBOOT OU RESET)!"
   exit 1
fi
 
echo "Numero de argumentos: $#"

while read IP; do 

echo "RESET:$IP"
if [ $? -eq 0 ]; then
        if [[ -n "$IP" ]]; then
		curl "http://$IP/cgi-bin/api-sys_operation?passcode=$SENHA&request=$ACAO"
fi
	fi

done < ip.log
