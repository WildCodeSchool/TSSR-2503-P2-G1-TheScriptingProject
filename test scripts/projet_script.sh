#!/bin/bash

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

echo "----------------------"
echo "Menu:"
echo "----------------------"
echo "1.Utilisateur"
echo "2.Ordinateur"
read -p "choisissez une cible : " choice1

case $choice1 in
1)
	echo "----------------------"
	echo "Menu Utilisateur"
	echo "----------------------"
	echo "1.Une action"
	echo "2.Une information"
	read -p "Que voulez-vous faire? " choice2
esac


case $choice2 in
2)
	echo "----------------------"
	echo "Menu des informations"
	echo "----------------------"
	echo "1. Date de dernière connexion"
	echo "2. Date de dernière modification de mot de passe"
	echo "3. Liste des sessions ouvertes par l'utilisateur"
	echo "4. Groupe d’appartenance d’un utilisateur"
	echo "5. Historique des commandes exécutées par l'utilisateur"
	echo "6. Droits/permissions de l’utilisateur sur un dossier"
	echo "7. Droits/permissions de l’utilisateur sur un fichier" 
	read -p "Choisissez une information " choice3
esac

case $choice3 in
1)
	echo "Voici la date de dernière connexion :"
bash ~/projet_script/last.sh;;
2)
	echo "Voici la dernière date de modification de mot de passe :"
bash ~/projet_script/lastdate_passwd.sh;;
3)
	echo "Voici la liste des sessions ouvertes par l'utilisateur"
bash ~/projet_script/open_user_session.sh;;
4)
	echo "Voici le Groupe d’appartenance d’un utilisateur"
bash ~/projet_script/user_groups.sh;;
5)
	echo "Voici l'Historique des commandes exécutées par l'utilisateur"
bash ~/projet_script/allcommand_user.sh;;
6)
	echo "Voici les Droits/permissions de l’utilisateur sur un dossier"
bash ~/projet_script/access_folder.sh;;
7)
	echo "Voici les Droits/permissions de l’utilisateur sur un fichier"
bash ~/projet_script/acces_file.sh;;
*)
	echo "Veuillez entrer un choix correct"
esac