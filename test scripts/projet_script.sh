#!/bin/bash

#----------------------------------------------------------------------------------------------------------------------
#				Fonctions utilisées ACTIONS UTILISATEUR
#----------------------------------------------------------------------------------------------------------------------









#----------------------------------------------------------------------------------------------------------------------
#				 Fonctions utilisées INFORMATIONS UTILISATEUR
#----------------------------------------------------------------------------------------------------------------------
#Fonction de dernière connexion
function lastdate_connexion()
{
        clear
        echo "Voici la date de dernière connexion :"
        last -1 $user
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_user_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction de dernière modification de mot de passe

function lastdate_passwd()
{
        clear
        echo "Voici la dernière date de modification de mot de passe :"
        passwd -s
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_user_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction de la liste des session ouvertes par un utilisateur

function open_user_session()
{
        clear
        echo "Voici la liste des sessions ouvertes par l'utilisateur :"
        who -u | grep "$user"
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_user_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction du groupe auquel appartient un utilisateur
function user_groups()
{
        clear
        echo "Voici le Groupe d'appartenance de l'utilisateur :"
        id -Gn $user
#	grep $user /etc/group
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_user_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction de l'historique des commandes exécutées par un utilisateur
function allcommand_user()
{
        clear
        echo "Voici l'historique des commandes exécutées par l'utilisateur :"
        cat ~/.bash_history
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_user_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction de visualisation des droits/permissions pour un utilisateur sur un dossier
function access_folder()
{
        clear
        read -p "quel dossier voulez-vous voir ? "$1
	cat ~/$1
        echo "Voici les droits/permissions de l'utilisateur sur ce dossier"
	chemin=~/Documents
	ls -ld "$chemin"
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_user_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction de visualisation des droits/permissions pour un utilisateur sur un fichier
function access_file()
{
        clear
        read -p "quel fichier voulez-vous voir ? "$1
        cat ~/$1
        echo "Voici les droits/permissions de l'utilisateur sur ce fichier"
        chemin=~/projet_script5.sh
        ls -l "$chemin"
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_user_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}

#------------------------------------------------------------------------------------------------------------------
#				 Fonctions utilisées ACTIONS ORDINATEUR
#------------------------------------------------------------------------------------------------------------------



#-----------------------------------------------------------------------------------------------------------------
#				 Fonctions utilisées INFORMATIONS ORDINATEUR
#-----------------------------------------------------------------------------------------------------------------

#Fonction version de l'OS
function os_version()
{
	clear
	echo "Voici la version de l'OS :"
	lsb_release -a 
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction nombre de disque
function disk_number()
{
        clear
        echo "Voici le nombre de disque :"
        lsblk
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction info partition
function partition_info()
{
        clear
        echo "Voici le détail des partitions :"
        fdisk -l
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction espace disque restant
function free_space()
{
        clear
        echo "Voici l'espace disque restant :"
        df -h
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction nom et espace disque d'un dossier
function info_folder()
{
        clear
	read -p "Entrez le nom d'un dossier sur lequel vous voulez des info ? " dossier
        echo "Voici le nom et l'espace disque du dossier :"
        du -sh ~/$dossier
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction liste des lecteurs montés
function mounted_drive_list()
{
        clear
        echo "Voici la liste des lecteurs montés :"
        findmnt
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction liste des applications/paquets installées
function pack_app_installed()
{
        clear
        echo "Voici la liste des applications/paquets installées :"
        apt --installed list
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction liste des services en cours d'exécution
function serv_progress()
{
        clear
        echo "Voici la liste des services en cours d'exécution :"
        systemctl list-units --type=service
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction liste des utilisateurs locaux
function local_users_list()
{
        clear
        echo "Voici la liste des utilisateurs locaux :"
        ######commande###########
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction mémoire RAM totale
function total_ram()
{
        clear
        echo "Voici la mémoire RAM total :"
        lshw -c memory
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}


#Fonction utilisation de la RAM
function ram_used()
{
        clear
        echo "Voici la mémoire RAM total :"
        free -h
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    esac
}









#-----------------------------------------------------------------------------------------------------------------------------------------
#							Droits d'accès
#-----------------------------------------------------------------------------------------------------------------------------------------
sudo chmod 744 ~/projet_script/reboot.sh
sudo chmod 744 ~/projet_script/power.sh
sudo chmod 744 ~/projet_script/total_ram.sh
sudo chmod 744 ~/projet_script/free_memory.sh
sudo chmod 744 ~/projet_script/access_file.sh

#-----------------------------------------------------------------------------------------------------------------------------------------
#                                                 Fonctions sous sous-menu
#-----------------------------------------------------------------------------------------------------------------------------------------

#Fonction du sous Menu des actions utilisateur
action_user_menu_choice ()
{
	clear
        echo "===== Menu des actions utilisateur ====="
        echo "                                        "
        echo "1.action 1"
        echo "2.action 2"
        echo "3.action 3"
        echo "4.action 4"
        echo "5.action 5"
        echo "6.action 6"
        echo "7.action 7"
        echo "8. Retour au menu précédent"
        read -p "Que voulez-vous faire? " action_user_menu_choice

	case $action_user_menu_choice in
	1)
		action 1;;
	2)
		action 2;;
	3)
		action 3;;
	4)
		action 4;;
	5)
		action 5;;
	6)
		action 6;;
	7)
		action 7;;
	8)
		user_menu;;
	esac
}


#Fonction du sous Menu des informations utilisateur
info_user_menu_choice ()
{
	clear
        echo "===== Menu des informations utilisateur ====="
        echo "                                             "
        echo "1. Date de dernière connexion"
        echo "2. Date de dernière modification de mot de passe"
        echo "3. Liste des sessions ouvertes par l'utilisateur"
        echo "4. Groupe d’appartenance d’un utilisateur"
        echo "5. Historique des commandes exécutées par l'utilisateur"
        echo "6. Droits/permissions de l’utilisateur sur un dossier"
        echo "7. Droits/permissions de l’utilisateur sur un fichier"
	echo "8. Retour au menu précédent" 
        read -p "Choisissez une information " info_user_menu_choice

	case $info_user_menu_choice in
 	1)
        	lastdate_connexion;;
 	2)
        	lastdate_passwd;;
 	3)
        	open_user_session;;
 	4)
        	user_groups;;
 	5)
        	allcommand_user;;
 	6)
        	access_folder;;
 	7)
        	acces_file;;
	8)
		user_menu;;
	esac
}

#Fonction du sous Menu des actions Ordinateur

action_computer_menu_choice ()
{
        clear
        echo "===== Menu des actions ordinateur ====="
        echo "                                       "
        echo "1.action 1"
        echo "2.action 2"
        echo "3.action 3"
        echo "4.action 4"
        echo "5.action 5"
        echo "6.action 6"
        echo "7.action 7"
	echo "8.action 8"
	echo "9.action 9"
	echo "10.action 10"
	echo "11.action 11"
	echo "12.action 12"
	echo "13.action 13"
        echo "14. Retour au menu précédent"
        read -p "Que voulez-vous faire? " action_computer_menu_choice

	case $action_computer_menu_choice in
	1)
	;;
	2)
	;;
	3)
	;;
	4)
	;;
	5)
	;;
	6)
	;;
	7)
	;;
	8)
	;;
	9)
	;;
	10)
	;;
	11)
	;;
	12)
	;;
	13)
	;;
	14)
		computer_menu;;
        esac
}




#Fonction du sous Menu des informations Ordinateur

info_computer_menu_choice ()
{
	clear
        echo "===== Menu des informations ordinateur ====="
        echo "                                            "
        echo "1.Version de l'OS"
        echo "2.Nombre de disque"
        echo "3.Partition (nombre, nom, FS, taille) par disque"
        echo "4.Espace disque restant par partition/volume"
        echo "5.Nom et espace disque d'un dossier (nom de dossier demandé)"
        echo "6.Liste des lecteurs monté (disque, CD, etc.)"
        echo "7.Liste des applications/paquets installées"
        echo "8. Liste des services en cours d'execution"
        echo "9.Liste des utilisateurs locaux"
        echo "10. Mémoire RAM totale"
        echo "11. Utilisation de la RAM"
        echo "12. Retour au menu précédent"
        read -p "Que voulez-vous faire? "  info_computer_menu_choice

	case $info_computer_menu_choice in
	1)
        	os_version;;
	2)
		disk_number;;
	3)
		partition_info;;
	4)
		free_space;;
	5)
		info_folder;;
	6)
       		mounted_drive_list;;
	7)
       		pack_app_installed;;
	8)
       		serv_progress;;
	9)
       		local_user_list;;
	10)
       		total_ram;;
	11)
       		ram_used;;
	12)
		computer_menu;;
	esac
}


#-------------------------------------------------------------------------------------------------------------------------------
#                                                     Fonction des sous menu
#------------------------------------------------------------------------------------------------------------------------------

#Fonction du Menu Utilisateur
user_menu ()
{
	clear
        echo "===== Menu Utilisateur ====="
        echo "                            "
        echo "1.Une action"
        echo "2.Une information"
        echo "3.Retour au menu précédent"
        read -p "Que voulez-vous faire? " user_menu_choice

	case $user_menu_choice in
	# Menu Utilisateur Action
	1)
	        action_user_menu_choice;;
	#Menu Utilisateur Information
	2)
        	info_user_menu_choice;;
	3)
	main_menu;;
	esac
}


#Fonction du Menu Ordinateur
computer_menu ()
{
	clear
        echo "===== Menu Ordinateur ====="
        echo "                           "
        echo "1.Une action"
        echo "2.Une information"
        echo "3. Retour au menu précédent"
	read -p "Que voulez-vous faire? " computer_menu_choice

	case $computer_menu_choice in
	# Menu Ordinateur Action
	1)
		action_computer_menu_choice;;
	2)
		info_computer_menu_choice;;
	3)
	main_menu;;
        esac
}



#-----------------------------------------------------------------------------------------------------------------------------------------
#								Menu Principal
#-----------------------------------------------------------------------------------------------------------------------------------------
function main_menu ()
{
	clear
	echo "===== Menu Principal ====="
	echo "                          "
	echo "1. Menu Utilisateur"
	echo "2. Menu Ordinateur"
	read -p "Choisissez votre cible : " main_choice

	case $main_choice in
	1)
		user_menu;;
	2)
      		computer_menu;;
	*)
        echo "Choix invalide, veuillez réessayer.";;
	esac
}
main_menu