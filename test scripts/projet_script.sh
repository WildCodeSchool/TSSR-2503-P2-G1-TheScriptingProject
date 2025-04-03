#!/bin/bash

# Fonctions utilisés

#Fonction de dernière connexion
function last.sh()
{
	echo "Voici la date de dernière connexion :"
bash ~/projet_script/last.sh
}

#Fonction de dernière modification de mot de passe
function lastdate_passwd.sh()
{
	echo "Voici la dernière date de modification de mot de passe :"
bash ~/projet_script/lastdate_passwd.sh
}

#Fonction de la liste des session ouvertes par un utilisateur
function open_user_session.sh()
{
	echo "Voici la liste des sessions ouvertes par l'utilisateur"
bash ~/projet_script/open_user_session.sh
}


#Fonction du groupe auquel appartient un utilisateur
function user_groups.sh()
{
	echo "Voici le Groupe d'appartenance de l'utilisateur"
bash ~/projet_script/user_groups.sh
}


#Fonction de l'historique des commandes exécutées par un utilisateur
function allcommand_user.sh()
{
	echo "Voici l'Historique des commandes exécutées par l'utilisateur"
bash ~/projet_script/allcommand_user.sh
}


#Fonction de visualisation des droits/permissions pour un utilisateur sur un dossier
function access_folder.sh()
{
	echo "Voici les Droits/permissions de l’utilisateur sur un dossier"
bash ~/projet_script/access_folder.sh
}


#Fonction de visualisation des droits/permissions pour un utilisateur sur un fichier
function access_file.sh()
{
	echo "Voici les Droits/permissions de l’utilisateur sur un fichier"
bash ~/projet_script/access_file.sh
}


#droits d'accès
sudo chmod 744 ~/projet_script/reboot.sh
sudo chmod 744 ~/projet_script/power.sh
sudo chmod 744 ~/projet_script/last.sh
sudo chmod 744 ~/projet_script/total_ram.sh
sudo chmod 744 ~/projet_script/free_memory.sh
sudo chmod 744 ~/projet_script/OS_version.sh
sudo chmod 744 ~/projet_script/lastdate_passwd.sh
sudo chmod 744 ~/projet_script/allcommand_user.sh
sudo chmod 744 ~/projet_script/user_groups.sh
sudo chmod 744 ~/projet_script/open_user_session.sh
sudo chmod 744 ~/projet_script/access_folder.sh
sudo chmod 744 ~/projet_script/access_file.sh


#Menu Principal
	echo "----------------------"
	echo "Menu:"
	echo "----------------------"
	echo "1.Utilisateur"
	echo "2.Ordinateur"
	read -p "choisissez une cible : " main_choice


case $main_choice in
#Menu Utilisateur
1)
	echo "----------------------"
	echo "Menu Utilisateur"
	echo "----------------------"
	echo "1.Une action"
	echo "2.Une information"
	read -p "Que voulez-vous faire? " menu_user_choice
;;
#Menu Ordinateur
2)
        echo "----------------------"
        echo "Menu Ordinateur"
        echo "----------------------"
        echo "1.Une action"
        echo "2.Une information"
        read -p "Que voulez-vous faire? " menu_computer_choice
;;
esac




case $menu_user_choice in
# Menu Utilisateur Action
1)
	echo "----------------------"
        echo "Menu des actions utilisateur"
        echo "----------------------"
        echo "1.action 1"
        echo "2.action 2"
	read -p "Que voulez-vous faire? " menu_action_user_choice
;;
#Choix des actions à faire suite



#Menu Utilisateur Information
2)
        echo "----------------------"
        echo "Menu des informations utilisateur"
        echo "----------------------"
        echo "1. Date de dernière connexion"
        echo "2. Date de dernière modification de mot de passe"
        echo "3. Liste des sessions ouvertes par l'utilisateur"
        echo "4. Groupe d’appartenance d’un utilisateur"
        echo "5. Historique des commandes exécutées par l'utilisateur"
        echo "6. Droits/permissions de l’utilisateur sur un dossier"
        echo "7. Droits/permissions de l’utilisateur sur un fichier" 
        read -p "Choisissez une information " menu_user_info_choice
;;
esac

#Appel des fonctions d'informations utilisateur 
case $menu_user_info_choice in
1)
        last.sh;;
2)
        lastdate_passwd.sh;;
3)
        open_user_session.sh;;
4)
        user_groups.sh;;
5)
        allcommand_user.sh;;
6)
        access_folder.sh;;
7)
        acces_file.sh;;
*)
        echo "Veuillez entrer un choix correct"
esac



case $menu_computer_choice in
# Menu Ordinateur Action
1)
        echo "----------------------"
        echo "Menu des actions ordinateur"
        echo "----------------------"
        echo "1.action 1"
        echo "2.action 2"
        read -p "Que voulez-vous faire? " menu_action_computer_choice
;;
#Choix des actions à faire suite

#Menu Ordinateur Informations
2)
	echo "---------------------"
	echo "Menu des informations ordinateur"
	echo "---------------------"
	echo "1.information 1"
	echo "2.information 2"
	echo "3.information 3"
	read -p "Que voulez-vous faire? "  menu_info_computer_choice
;;
#Choix des informations à faire suite
esac



