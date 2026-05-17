#!/bin/bash

# animation
fake_load() {
    local text="$1"
    echo -n "$text"
    for i in {1..3}; do
        sleep 0.4
        echo -n "."
    done
    echo "done"
    sleep 0.5
}

clear
echo "looking for needed packages..."

sudo pacman -S --needed --noconfirm base-devel git

sleep 1.5

clear
PS3="choose aur helper: "
options=("yay" "paru" "trizen" "pikaur" "pakku" "aura" "skip")

select opt in "${options[@]}"; do
    case $opt in
	    "yay")
             fake_load "installing yay..."
            # typo commands to install
            cd /tmp
            git clone https://aur.archlinux.org/yay.git
            cd yay
            makepkg -si
            cd ~
            break
            ;;
           "paru")
             fake_load "installing paru..."
            cd /tmp
            git clone https://aur.archlinux.org/paru.git
            cd paru
            makepkg -si
            cd ~
            break
            ;;
	   "aura")
            fake_load "installing aura..."
            cd /tmp
            git clone https://aur.archlinux.org/aura.git 
            cd aura
            makepkg -si
            cd ~
            break
            ;;
            "trizen")
             fake_load "installing trizen..."
            cd /tmp
            git clone https://aur.archlinux.org/trizen.git 
            cd trizen
            makepkg -si
            cd ~
             break
            ;;

	    "pikaur") 
             fake_load "installing pikaur..."
            cd /tmp
            git clone https://aur.archlinux.org/pikaur.git 
            cd pikaur
            makepkg -si
            cd ~
              break
            ;;

            "pakku")
             fake_load "installing pakku..."
            cd /tmp
            git clone https://aur.archlinux.org/pakku.git 
            cd pakku
            makepkg -si
            cd ~
            break 
            ;;
           "skip")
            fake_load "skipping install."
            break
            ;;
        *)
		echo "write correct option"
            ;;
	esac
done
echo "aur helper install finished, moving to shell"

sleep 1.5

clear
PS3="choose shell you want to install: "
shell_options=("fish" "zsh" "skip")

select shell_opt in "${shell_options[@]}"; do
	case $shell_opt in
		"fish")
            fake_load "Устанавливаем fish..."
            # installig fish fish
            sudo pacman -S fish
            chsh -s /bin/fish
            break
            ;;
           "zsh")
            fake_load "Устанавливаем zsh..."
            # installing zsh
            sudo pacman -S zsh
            chsh -s /bin/zsh
            break
            ;;
    	   "skip")
            fake_load "skipping shell install."
            break
            ;;
        *)
		echo "write correct option"
            ;;
	esac
done

#echo "shell configuration ended do you"
sleep 1.5
clear

PS3="do you wish to reboot your system to let changes take affect: "
echo "shell configuration endede"
rebo_options=("reboot" "skip")

select rebo_opt in "${rebo_options[@]}"; do
	case $rebo_opt in
		"reboot")
			fake_load "rebooting your hardware..."
			reboot
			break
			;;
		"skip")
			fake_load "skipping reboot"
			break
			;;
		*)
			fake_load "write correct option"
			;;
	esac
done

	      
