#!/bin/bash

PS3="choose AUR helper: "
options=("yay" "paru" "trizen" "pikaur" "pakku" "aura" "skip")

select opt in "${options[@]}"; do
    case $opt in
	    "yay")
            echo "installing yay..."
            # typo commands to install
            cd /tmp
            git clone https://aur.archlinux.org/yay.git
            cd yay
            makepkg -si
            cd ~
            break
            ;;
           "paru")
            echo "installing paru..."
            cd /tmp
            git clone https://aur.archlinux.org/paru.git
            cd paru
            makepkg -si
            cd ~
            break
            ;;
	   "aura")
            echo "installing aura..."
            cd /tmp
            git clone https://aur.archlinux.org/aura.git 
            cd aura
            makepkg -si
            cd ~
            break
            ;;
            "trizen")
             echo "installing trizen..."
            cd /tmp
            git clone https://aur.archlinux.org/trizen.git 
            cd trizen
            makepkg -si
            cd ~
             break
            ;;

	    "pikaur") 
             echo "installing pikaur..."
            cd /tmp
            git clone https://aur.archlinux.org/pikaur.git 
            cd pikaur
            makepkg -si
            cd ~
              break
            ;;

            "pakku")
             echo "installing pakku..."
            cd /tmp
            git clone https://aur.archlinux.org/pakku.git 
            cd pakku
            makepkg -si
            cd ~
            break 
            ;;
           "skip")
            echo "skipping install."
            break
            ;;
        *)
            echo "wrong answer."
            ;;
    esac
done

echo "aur helper install finished, moving to shell"

PS3="choose shell you want to install: "
shell_options=("fish" "zsh" "skip")

select shell_opt in "${shell_options[@]}"; do
	case $shell_opt in
		"fish")
            echo "Устанавливаем fish..."
            # installig fish fish
            sudo pacman -S fish
            chsh -s /bin/fish
            break
            ;;
    "zsh")
            echo "Устанавливаем zsh..."
            # installing zsh
            sudo pacman -S zsh
            chsh -s /bib/zsh
            break
            ;;
    "skip")
            echo "skipping shell install."
            break
            ;;
        *)
            echo "wrong answer."
            ;;
    esac
done

#echo "shell configuration ended do you"


PS3="shell configuration ended. do you wish to reboot your system to let changes take affect on your pc"
rebo_options=("reboot" "keep working(changes wont apply until you reboot pc)"

select rebo_opt in "${rebo_options[@]}"; do
	case $redo_opt in
		"reboot")
			echo "rebooting your hardware..."
			reboot
			break
			;;
		"keep working(changes wont apply until you reboot pc)")
			echo "skipping reboot"
			break
			;;
		*)

	      
