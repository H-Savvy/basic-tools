#!/bin/bash
clear
GREEN="\033[1;32m"
CYAN="\033[1;36m"
RESET="\033[0m"
YELLOW="\033[1;33m"
  echo
header() {
  echo -e "${CYAN}"
  echo -e "${GREEN}           By Aguilar_Leo    &&    By  Percy Limachi                          ${RESET}"
  echo
  echo "██████╗░░█████╗░░██████╗██╗░█████╗░░░░░░░████████╗░█████╗░░█████╗░██╗░░░░░░██████╗"
  echo "██╔══██╗██╔══██╗██╔════╝██║██╔══██╗░░░░░░╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░██╔════╝"
  echo "██████╦╝███████║╚█████╗░██║██║░░╚═╝█████╗░░░██║░░░██║░░██║██║░░██║██║░░░░░╚█████╗░"
  echo "██╔══██╗██╔══██║░╚═══██╗██║██║░░██╗╚════╝░░░██║░░░██║░░██║██║░░██║██║░░░░░░╚═══██╗"
  echo "██████╦╝██║░░██║██████╔╝██║╚█████╔╝░░░░░░░░░██║░░░╚█████╔╝╚█████╔╝███████╗██████╔╝"
  echo "╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░╚════╝░░░░░░░░░░╚═╝░░░░╚════╝░░╚════╝░╚══════╝╚═════╝░"
  echo
  echo -e "${GREEN}   --- -------------------------------------------------------------------- ---${RESET}"
  echo -e "${GREEN}        1)${RESET} Realizar instalacion            ${GREEN}2)${RESET} Instalar aplicaiones externas"
  echo
  echo -e "${GREEN}        3)${RESET} Verificar las instalaciones     ${GREEN}4)${RESET} Salir"
  echo
  echo -e "${RESET}"
}
menu2() {
    echo
    echo -e "${CYAN}---- MENU ----"
    echo -e "${GREEN} 1)${RESET} Telegram"
    echo -e "${GREEN} 2)${RESET} Discord"
    echo -e "${GREEN} 3)${RESET} Chrome"
    echo -e "${GREEN} 4)${RESET} Virtualbox"
    echo -e "${GREEN} 5)${RESET} SublimeText"
    echo -e "${GREEN} 6)${RESET} Volver"
    echo
}
controlador=false
function barradecarga() {
    local -r animacion="/-\|"
    echo -ne "\r"
    while true; do
        for char in $(echo -n "$animacion"); do
            echo -n "$char"
            sleep 0.1
            echo -ne "\b"
        done
    done
}
function tiempo() {
    local -r duracion=4
    sleep "$duracion"
}
instalar_telegram() {
    echo "Instalando Telegram..."
    sudo apt update
    sudo apt install -y telegram-desktop
}

instalar_discord() {
    echo "Instalando Discord..."
    wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
    sudo apt install -y ./discord.deb
    rm discord.deb
}

instalar_chrome() {
    echo "Instalando Google Chrome..."
    wget -qO - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/google-archive-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt update
    sudo apt install -y google-chrome-stable
}

instalar_virtualbox() {
    echo "Instalando VirtualBox..."
    sudo apt update
    sudo apt install -y virtualbox
}

instalar_sublimeText() {
    echo "Instalando Sublime Text..."
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/sublime-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/sublime-archive-keyring.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt update
    sudo apt install -y sublime-text
}

set_apps=(
  telegram-desktop
  discord
  google-chrome-stable
  virtualbox
  sublime-text
)

set_tools=(
  git
  curl
  wget
  vim
  nano
  emacs
  neovim
  sysstat
  glances
  python3
  nodejs
  openjdk-11-jdk
  gnome-shell
  kde-plasma-desktop
  xfce4
  gparted
  timeshift
  fail2ban
  rkhunter
  gnupg
  apache2
  mariadb-server
  php
  vlc
  ffmpeg
  unzip
  zip
  p7zip-full
  clang
)
all_set=(
  git
  curl
  wget
  vim
  nano
  emacs
  neovim
  sysstat
  glances
  python3
  nodejs
  openjdk-11-jdk
  gnome-shell
  kde-plasma-desktop
  xfce4
  gparted
  timeshift
  fail2ban
  rkhunter
  gnupg
  apache2
  mariadb-server
  php
  vlc
  ffmpeg
  unzip
  zip
  p7zip-full
  clang
  telegram-desktop
  discord
  google-chrome-stable
  virtualbox
  sublime-text
)
op=0
echo
updatesf() {
  echo -e "${GREEN}✔ $1${RESET}"
}
warning() {
  echo -e "${YELLOW}⚠ $1${RESET}"
}
if [[ $EUID -ne 0 ]]; then
  warning "Este script debe ejecutarse con privilegios de administrador."
  exit 1
fi
while [[ $option -ne 4 ]]; do
header
read -p "Seleccione una opcion (1-4): " op
case $op in
1)
   echo -e "${GREEN}Opcion 1 seleccionada: se instalaran paquetes y herramientas comunes${RESET}"
   barradecarga &
   tiempo
   kill $! &>/dev/null
   clear
   updatesf "Actualizando la lista de paquetes disponibles..."
   apt update
   updatesf "Instalando paquetes y herramientas comunes..."
     for package in "${set_tools[@]}"; do
        if ! dpkg -s "$package" &>/dev/null; then
           apt install -y "$package"
           updatesf "Paquete '$package' instalado con exito."
        else
           warning "El paquete '$package' ya esta instalado. omitiendo"
        fi
     done
   echo
   updatesf "Instalación completada."
   ;;
2)
   clear
   echo -e "${GREEN}Opcion 2 seleccionada: elija que aplicaion desea instalar${RESET}"
   barradecarga &
   tiempo
   kill $! &>/dev/null
   clear
    while true; do
    menu2
    read -p "Seleccione una opcion: " opc
    case $opc in
        1)
            clear
            updatesf "Ha seleccionado telegram"
	    echo
            for package in "${set_apps[@]}"; do
	        if ! dpkg -s "$package" &>/dev/null; then
                    instalar_telegram
		    controlador=true
	            clear
                    updatesf "Instalacion completada."
		    break
		fi
            done
	    if [ "$controlador" = false ]; then
		    warning "La aplicaion Telegram ya esta instalada"
		    fi
   	    controlador=false
            ;;
        2)
            clear
            updatesf "Ha seleccionado discord"
            echo
	    for package in "${set_apps[@]}"; do
	        if ! dpkg -s "$package" &>/dev/null; then
 		    instalar_discord
		    controlador=true
		    clear
     	   	    updatesf "Instalacion completada."
		    break
                fi
	    done
            if [ "$controlador" = false ]; then
		 warning "La aplicaion Discord ya esta instalada"
                fi
	    controlador=false
            ;;
        3)
 	    clear
            updatesf "Ha seleccionado chrome"
	    echo
	    for package in "${set_apps[@]}"; do
	       if ! dpkg -s "$package" &>/dev/null; then
	       	    instalar_chrome
		    controlador=true
        	    clear
           	    updatesf "Instalacion completada."
                    break
                 fi
            done
	    if [ "$controlador" = false ]; then
                    warning "La aplicaion Chrome ya esta instalada"
                fi
            controlador=false
            ;;
        4)
     	    clear
            updatesf "Ha seleccionado virtualbox"
	    echo
	    for package in "${set_apps[@]}"; do
	       if ! dpkg -s "$package" &>/dev/null; then
	            instalar_virtualbox
		    controlador=true
        	    clear
           	    updatesf "Instalacion completada."
               fi
            done
	    if [ "$controlador" = false ]; then
                    warning "La aplicaion VirtualBox ya esta instalada"
                fi
            controlador=false
            ;;
        5)
	    clear
            updatesf "Ha seleccionado sublimeText"
            echo
	    for package in "${set_apps[@]}"; do
   		 if ! dpkg -s "$package" &>/dev/null; then
                    instalar_sublimeText
		    controlador=true
           	    clear
         	    updatesf "Instalacion completada."
		 fi
            done
 	    if [ "$controlador" = false ]; then
                    warning "La aplicaion SublimeText ya esta instalada"
                fi
            controlador=false
            ;;
        6)
            clear
            echo
            warning "volviendo al menu anterior..."
            barradecarga &
            tiempo
   	    kill $! &>/dev/null
   	    clear
            break
            ;;
        *)
	    clear
            echo
            warning "Por favor, seleccione una opcion valida del menu"
            ;;
    esac
done

   ;;
3)
   echo -e "${GREEN}Opcion 3 seleccionada: aqui puede ver las herramientas instaladas${RESET}"
   barradecarga &
   tiempo
   kill $! &>/dev/null
   clear
    for package in "${all_set[@]}"; do
        if ! dpkg -s "$package" &>/dev/null; then
           warning "Paquete '$package' aun no se ha instalado"
        else
           updatesf "El paquete '$package' ya esta instalado."
        fi
     done
   ;;
4)
   clear
   echo -e "${GREEN}Gracias por usar el script. ¡Hasta luego!${RESET}"
   exit 0
   ;;
*)
   clear
   echo -e "${YELLOW}Por favor, seleccione una opcion valida (1-4).${RESET}"
   ;;
  esac
done

