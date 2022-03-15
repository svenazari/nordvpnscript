#!/bin/bash

#Install NordVPN by using this command: sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

function loz {
  read -sp "Password for $(whoami): " passwd
  echo "$passwd" | sudo -S echo " " > /tmp/test
  if [ $? -eq 0 ]; then
    echo "$passwd" > /home/$(whoami)/.pass_nord.txt
    clear
    logo
  else
    echo "Wrong password!"
    loz
  fi
}

function logo {
  echo "
  NNN NN                   VV   VV PPPPP NNN NN
  NNNNNN OOOOOO RRRRR DDD  VV   VV PP PP NNNNNN
  NN NNN OOOOOO RR RR DDDD  VV VV  PPPPP NN NNN
  NN  NN OO  OO RRRRR DD D  VV VV  PP    NN  NN
  NN  NN OOOOOO RR R  DDDD   VVV   PP    NN  NN
  NN  NN OOOOOO RR RR DDD     V    PP    NN  NN
  
  #############################################
  #############################################"
  echo " "
  main
}

function main {
  echo "
    1   Login
    2   Logout
    3   Connect
    4   Disconnect
    5   Cybersec ON
    6   Cybersec OFF
    7   Killswitch ON
    8   Killswitch OFF
    9   Status
    0   Exit
    "

    while true; do
      read -p "Choose: " SELECT
      case "$SELECT" in
        1) SELECT=login;;
        2) SELECT=logout;;
        3) SELECT=connect;;
        4) SELECT=disconnect;;
        5) SELECT=csecon;;
        6) SELECT=csecoff;;
        7) SELECT=kswitchon;;
        8) SELECT=kswitchoff;;
        9) SELECT=status;;
        0) SELECT=exi;;
        *) echo Invalid selection.; continue
      esac
      break
    done
}

function login {
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn login --legacy
  else
    sudo nordvpn login --legacy
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo
}

function logout {
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn logout
  else
    sudo nordvpn logout
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo
}

function connect {
  clear
  echo "
    1.  Just connect
    2.  Select country
    3.  Connect to UK
    4.  Connect to US
    5.  Back
    "

    while true; do
      read -p "Choose: " SELECT
      case "$SELECT" in
        1) SELECT=jconnect;;
        2) SELECT=country;;
        3) SELECT=connectuk;;
        4) SELECT=connectus;;
        5) SELECT=bconnect;;
        *) echo Invalid selection.; continue
      esac
      break
    done
}

function jconnect {
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn connect
  else
    sudo nordvpn connect
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo  
}

function country {
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn countries
  else
    sudo nordvpn countries
  fi
  echo " "
  echo "Select country: "
  read country
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn connect $country
  else
    sudo nordvpn connect $country
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo 
}

function connectuk {
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn connect United_Kingdom
  else
    sudo nordvpn connect United_Kingdom
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo  
}

function connectus {
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn connect United_States
  else
    sudo nordvpn connect United_Kingdom
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo  

}

function bconnect {
  clear
  logo
}

function disconnect {
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn disconnect
  else
    sudo nordvpn disconnect
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo
}

function status {
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn status
  else
    sudo nordvpn status
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo
}

function csecon {
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn set cybersec on
  else 
    sudo nordvpn set cybersec on
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo
}

function csecoff {
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn set cybersec off
  else
    sudo nordvpn set cybersec off
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo
}

function kswitchon {
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn set killswitch on
  else
    sudo nordvpn set killswitch on
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo
}

function kswitchoff {
  clear
  FILE=/home/$(whoami)/.pass_nord.txt
    if test -f "$FILE"; then
    read line  < "$FILE"
    echo "$line" | sudo -S nordvpn set killswitch off
  else
    sudo nordvpn set killswitch off
  fi
  echo " "
  echo "####"
  echo "####"
  echo " "
  logo
}

function exi {
  FILE=/home/$(whoami)/.pass_nord.txt
  if test -f "$FILE"; then
    rm "$FILE"
  fi
  clear
  exit
}

loz

while test $? -eq 0; do
  $SELECT
done
