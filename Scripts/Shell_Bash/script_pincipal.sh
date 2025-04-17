#!/bin/bash


#-----------------------------------------------------------------------------------------------------------------------------------------
#                                                 Fonctions sous sous-menu
#-----------------------------------------------------------------------------------------------------------------------------------------

#Fonction du sous Menu des actions utilisateur
function action_user_menu_choice ()
{
	clear
        echo "===== Menu des actions utilisateur ====="
        echo "                                        "
        echo "1. Création de compte utilisateur local"
        echo "2. Changement de mot de passe"
        echo "3. Suppression de compte utilisateur local"
        echo "4. Désactivation de compte utilisateur local"
        echo "5. Ajout à un groupe d'administration"
        echo "6. Ajout à un groupe local"
        echo "7. Sortie d’un groupe local"
        echo "8. Retour au menu précédent"
	echo "                                        "
        read -p "Que voulez-vous faire? " action_user_menu_choice

	case $action_user_menu_choice in
	1)
		creating_a_local_user_account;;
	2)
		change_password;;
	3)
		deleting_a_local_user_account;;
	4)
		local_user_account_deactivation;;
	5)
		adding_to_an_administration_group;;
	6)
		adding_to_a_local_group;;
	7)
		local_band_release;;
	8)
		user_menu;;
	*)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        action_user_menu_choice;;
	esac
}


#Fonction du sous Menu des informations utilisateur
function info_user_menu_choice ()
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
	echo "                                        "
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
        	access_file;;
	8)
		user_menu;;
	*)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        info_user_menu_choice;;
	esac
}

#Fonction du sous Menu des actions Ordinateur

function action_computer_menu_choice ()
{
        clear
        echo "===== Menu des actions ordinateur ====="
        echo "                                       "
        echo "1. Arrêt ordinateur"
        echo "2. Redémarrage ordinateur"
        echo "3. Verrouillage ordinateur"
        echo "4. Mise-à-jour du système"
        echo "5. Création de répertoire"
        echo "6. Modification de répertoire"
        echo "7. Suppression de répertoire"
	echo "8. Prise de main à distance (CLI)"
	echo "9. Activation du pare-feu"
	echo "10. Désactivation du pare-feu"
	echo "11. Installation de logiciel"
	echo "12. Désinstallation de logiciel"
	echo "13. Exécution de script sur la machine distante"
        echo "14. Retour au menu précédent"
	echo "                                       "
        read -p "Que voulez-vous faire? " action_computer_menu_choice

	case $action_computer_menu_choice in
	1)
        	computer_shutdown;;
	2)
        	restart_computer;;
	3)
        	computer_lock;;
	4)
        	system_update;;
	5)
        	directory_creation;;
	6)
        	directory_modification;;
	7)
        	directory_deletion;;
	8)
        	remote_control;;
	9)
        	enabling_the_firewall;;
	10)
        	disabling_the_firewall;;
	11)
        	software_installation;;
	12)
        	software_uninstallation;;
	13)
        	script_execution_on_the_remote_machine;;
	14)
		computer_menu;;
	*)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        action_computer_menu_choice;;
        esac
}




#Fonction du sous Menu des informations Ordinateur

function info_computer_menu_choice ()
{
	clear
        echo "===== Menu des informations ordinateur ====="
        echo "                                            "
        echo "1. Version de l'OS"
        echo "2. Nombre de disque"
        echo "3. Partition (nombre, nom, FS, taille) par disque"
        echo "4. Espace disque restant par partition/volume"
        echo "5. Nom et espace disque d'un dossier (nom de dossier demandé)"
        echo "6. Liste des lecteurs monté (disque, CD, etc.)"
        echo "7. Liste des applications/paquets installées"
        echo "8. Liste des services en cours d'execution"
        echo "9. Liste des utilisateurs locaux"
        echo "10. Mémoire RAM totale"
        echo "11. Utilisation de la RAM"
        echo "12. Retour au menu précédent"
	echo "                                        "
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
        	local_users_list;;
	10)
        	total_ram;;
	11)
        	ram_used;;
	12)
		computer_menu;;
	*)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        info_computer_menu_choice;;
	esac
}


#-------------------------------------------------------------------------------------------------------------------------------
#                                                     Fonction des sous menu
#------------------------------------------------------------------------------------------------------------------------------

#Fonction du Menu Utilisateur
function user_menu ()
{
	clear
        echo "===== Menu Utilisateur ====="
        echo "                            "
        echo "1. Une action"
        echo "2. Une information"
        echo "3. Retour au menu précédent"
	echo "                            "
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
	*)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        user_menu;;
	esac
}


#Fonction du Menu Ordinateur
function computer_menu ()
{
	clear
        echo "===== Menu Ordinateur ====="
        echo "                           "
        echo "1. Une action"
        echo "2. Une information"
        echo "3. Retour au menu précédent"
	echo "                           "
	read -p "Que voulez-vous faire? " computer_menu_choice

	case $computer_menu_choice in
	# Menu Ordinateur Action
	1)
		action_computer_menu_choice;;
	2)
		info_computer_menu_choice;;
	3)
		main_menu;;
	*)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        computer_menu;;
        esac
}



#Fonction du Menu Script
function script_menu ()
{
	clear
	echo "===== Menu Script ====="
	echo "                       "
	echo "1. Recherche des évènements pour un utilisateur"
	echo "2. Recherche des évènements pour un ordinateur"
	echo "3. Retour au menu précédent"
	echo "                       "
	read -p "Que voulez-vous faire ? " script_menu_choice

	case $script_menu_choice in
	# Menu Script
	1)
		user_event;;
	2)
		computer_event;;
	3)
		main_menu;;
	*)
	read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        script_menu;;
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
	echo "3. Menu Script"
	echo "                          "
	read -p "Choisissez votre cible : " main_choice

	case $main_choice in
	1)
		user_menu;;
	2)
        	computer_menu;;
	3)
		script_menu;;
	*)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
	main_menu;;
	esac
}
main_menu