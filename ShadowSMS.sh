#!/bin/bash

#
# ┌-----------┐  ┌------------┐
# █ ShadowSMS █=>█ 06/11/2021 █
# └-----------┘  └------------┘
#

#VARIABLES

PWD=$(pwd)
SYSTEM=$(uname -o)

negro="\e[1;30m"
azul="\e[1;34m"
verde="\e[1;32m"
cian="\e[1;36m"
rojo="\e[1;31m"
purpura="\e[1;35m"
amarillo="\e[1;33m"
blanco="\e[1;37m"

black="\e[0;30m"
blue="\e[0;34m"
green="\e[0;32m"
cyan="\e[0;36m"
red="\e[0;31m"
purple="\e[0;35m"
yellow="\e[0;33m"
white="\e[0;37m"
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
echo -e "${negro}
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMNNNMMMMMMMMMNmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNNMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMNy+::-::/+yNMMMM/.sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMy.:MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmy+::-::/oyMMMMMy+++mMMMMMMMMm+++sMMMMMNho/:-:::+smMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMy. :syhhys/-mMMMM: oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMs -MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMs  :syhhys/-NMMMM/   -NMMMMMMM:   -MMMMm: .oyhhhs+:sMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMN  +MMMMMMMMMMMMMM: oMNhyshmNMMMMMMNmhyyyhdNMMMMMMMMMmhyyhmMs -MMMMMMNmhysydNMMMMMNmmMMMMMNmmNMMMMMNmNMMN  oMMMMMMMMMMMMMM/ :o +MMMMMMs /+ -MMMM/ .NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMN  /NMMMMMMMMMMMMM: /+-/+/- -dMMMMM:.:+++: .+NMMMMMd: ./+/-:+ -MMMMMy- -++/. /mMMMd  mMMMMo  -MMMMM- sMMN  +NMMMMMMMMMMMMM/ :N- hMMMMd .N+ -MMMM/ .mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMh.  :+oyhNMMMMMMM:  yMMMMMo .MMMMMNMMMMMMN+ :MMMMd  yMMMMMs  -MMMMo  dMMMMNo  dMMM/ +MMMN .: hMMMy .NMMMy  .:+sydNMMMMMMM/ :Mm  mMMN. dM+ -MMMMm:  -/oshmMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMds+:-   .+NMMMM: +MMMMMMN  dMMMMMMdhyssso  NMMM: +MMMMMMM/ -MMMN  yMMMMMMM: /MMMd  mMM+ sm -MMM. sMMMMMMhs/:-   .oNMMMM/ :MMy :MM/ sMM+ -MMMMMMmy+/-.   /dMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMM/:::::::::-    ::::  .:::::::  -:::::          ::::  .:::::::.  :::-  ::::::::.  ::::  .::  ::  ::-  :::::::::::::-   .::::   :::  -:  :::.  :::::::::::::    ::NMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMmddddddddddds  sddd- +ddddddd  yddd. +dddddds  hddd- :ddddddd: .dddh  oddddddd- :ddddh  y: oddh .d  sdddddddddddddddo  yddd: -dddd.   dddd/ -ddddddddddddddd  :dMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMydNMMMMMMm:  mMMM: oMMMMMMM  dMMM- oMMMMMd-  mMMMh  yMMMMMy  -MMMM+ .dMMMMMo  dMMMMM/ : .MMMM/ / .NMMMMNymNMMMMMMd- .NMMM/ :MMMMdoodMMMM+ -MMMMhdNMMMMMMNo  yMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMM-..-://:-  /dMMMM: oMMMMMMM  dMMMd- -+o+::o  mMMMMh: -+o+::+ -MMMMMs- :oo+- :dMMMMMMm   yMMMMm   yMMMMMN...-///:. ./mMMMM/ :MMMMMMMMMMMM+ -MMMM+. .:///-. -yMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMNmdyssosydmMMMMMMhymMMMMMMMyyNMMMMNdyssydNNyyNMMMMMNdyssydNmyhMMMMMMNdysoshmMMMMMMMMMhyyNMMMMMhyyMMMMMMMNmdyssosydmMMMMMMdydMMMMMMMMMMMMdyhMMMMNmdhysosyhmNMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"${blanco}
}

#SOLICITANDO

InputData(){
	ShadowSMS
echo -e -n "${negro}
┌-------------------┐
█ ${blanco}NÚMERO TELEFÓNICO ${negro}█
└-------------------┘
┃
└->>> "${verde}
	read -r NUMBER
	sleep 0.5
echo -e -n "${negro}
┌------------------┐
█ ${blanco}MENSAJE A ENVIAR ${negro}█
└------------------┘
┃
└->>> "${verde}
	read -r SMS
	curl -X POST https://textbelt.com/text --data-urlencode phone="${NUMBER}" --data-urlencode message="${SMS}" -d key=textbelt > /dev/null 2>&1
	if [[ $(echo $?) == "0" ]]; then
echo -e "${negro}
┌-----------------┐
█ ${verde}MENSAJE ENVIADO ${negro}█
└-----------------┘
"${blanco}
	else
echo -e "${negro}
┌--------------------┐
█ ${rojo}MENSAJE NO ENVIADO ${negro}█
└--------------------┘
"${blanco}
	fi
}

#DECLARANDO

Requirements
InputData
# -----------------------------------------------
#     Creado por LOUISSTANICA -  ©2021
# -----------------------------------------------
