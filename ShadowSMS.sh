#!/bin/bash

#
#   ┌-----------┐
#   | ShadowSMS |
#   └-----------┘
#

#VARIABLES

PWD=$(pwd)
SYSTEM=$(uname -o)


Requirements(){
	if [ "${SYSTEM}" == "Android" ]; then
		APT="pkg"
		BIN="/data/data/com.termux/files/usr/bin"
	else
		APT="apt-get"
		BIN="/bin"
	fi
	if [ ! -x ${BIN}/curl ]; then
		${APT} install curl -y
	fi
	if [ ! -x ${BIN}/figlet ]; then
                ${APT} install figlet -y
        fi

	if [ ! -x ${BIN}/ShadowSMS ]; then
		echo "#!/bin/bash" >> ${BIN}/ShadowSMS
		echo "ShadowSMS='${PWD}'" >> ${BIN}/ShadowSMS
		echo 'cd ${ShadowSMS}' >> ${BIN}/ShadowSMS
		echo 'exec bash "${ShadowSMS}/ShadowSMS.sh" "$@"' >> ${BIN}/ShadowSMS
		chmod 777 ${BIN}/ShadowSMS
	fi
}

#BANNER DE TEXTO ShadowSMS

ShadowSMS(){
	sleep 0.5
	clear
figlet Shadow SMS
}

#SOLICITANDO

InputData(){
	ShadowSMS
echo -e -n "

┌-------------------┐
| NÚMERO TELEFÓNICO |
└-------------------┘

┃
└->>> "
	read -r NUMBER
	sleep 0.5
echo -e -n "
┌------------------┐
| MENSAJE A ENVIAR |
└------------------┘
┃
└->>> "
	read -r SMS
	curl -X POST https://textbelt.com/text --data-urlencode phone="${NUMBER}" --data-urlencode message="${SMS}" -d key=textbelt > /dev/null 2>&1
	if [[ $(echo $?) == "0" ]]; then
echo -e "
┌-----------------┐
| MENSAJE ENVIADO |
└-----------------┘
"
	else
echo -e "
┌--------------------┐
| MENSAJE NO ENVIADO |
└--------------------┘
"
	fi
}

#DECLARANDO

Requirements
InputData
# -----------------------------------------------
#     Creado por LOUISSTANICA -  ©2021
# -----------------------------------------------
