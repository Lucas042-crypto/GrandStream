# GrandStream
Provisionamento de telefones em massa


Para funcionar a função dhcp-option 66 devera ser configurado no DHCP para que o telefone faça uma varredura na rede
e de acordo com MAC provisione o ramal.

Este script reseta ou reboota os telefones de uma vez, facilitando o processo manual:

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

OBS: NECESSÁRIO FAZER UMA LISTA COM OS IP'S - ip.log
