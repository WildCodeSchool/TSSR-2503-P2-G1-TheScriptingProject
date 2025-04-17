#!/bin/bash

#----------------------------------------------------------------------------------------------------------------------
#				Fonctions utilisées ACTIONS UTILISATEUR
#----------------------------------------------------------------------------------------------------------------------
#Fonction de création de compte utilisateur local
function creating_a_local_user_account()
{
    #Demande Nom du nouvel utilisateur à créer
    echo " Quel est le nom du nouvel utilisateur?"
    read -p new_user

    #Vérifier si l'utilisateur existe déjà
    if cat /etc/passwd | grep $new_user > /dev/null
    then
        echo "L'utilisateur existe déjà"
        exit 1
    else
        echo "Création du nouvel utilisateur"
        sudo useradd $new_user > /dev/null
            #Vérifier si l'utilisateur a bien été créer
            if cat /etc/passwd | grep $new_user > /dev/null
            then
                echo "L'utilisateur a été créer"
            else
                echo "L'utilisateur n'a pas été crée = ERREUR"
            fi
    fi
exit 0
}


#Fonction Changement de mot de passe
function change_password ()
{
    #Changement du mot de passe
    echo "Entrer le nom de l'utilisateur"
    read -p nom_utilisateur
    sudo passwd $nom_utilisateur
exit 0
}


#Fonction de la suppression de compte utilisateur local
function deleting_a_local_user_account ()
{
    #Donner le nom de l'utilisateur à supprimer
    echo "Quel est le nom de l'utilisateur à supprimer?"
    read user_name

    #Vérifier l'existence de l'utilisateur
    if cat /etc/passwd | grep $user_name > /dev/null
    then
        echo "Suppression de l'utilisateur en cours"
        sudo userdel $user_name

        #Vérifier la suppression de l'utilisateur
        if cat etc/passwd | grep $user_name > /dev/null
        then
            echo "ERREUR utilisateur non supprimé"
        else
            echo "L'utilisateur a bien été supprimer"
        fi
    else
        echo "L'utilisateur n'existe pas"
        echo "Aucun utilisateur supprimé"
        exit 1
    fi
exit 0
}


#Fonction de la désactivation de compte utilisateur local
function local_user_account_deactivation ()
{
    #Donner le nom de l'utilisateur à Désactiver
    echo "Donner le nom utilisateur à désacitver"
    read -p name_user

    #Vérifier si l'utilisateur existe
    if cat /etc/passwd | grep "$name_user" > /dev/null
    then
        #Désactiver l'utilisateur
        echo "Désactivation de l'utilisateur"
        sudo usermod -L
        echo "Utilisateur désactivé"
    else
        #Problème de désactivation
        echo "Le nom utilisateur n'existe pas"
        exit 1
    fi
exit 0
}


#Fonction d'ajout à un groupe d'administration
function adding_to_an_administration_group ()
{
    #Demander le nom utilisateur
    echo "Quel utilisateur souhaitez-vous ajouter au groupe administrateur?"
    read user_name

    #Vérifier si l'utilisateur existe
    if cat /etc/passwd | grep $user_name > /dev/null
    then
        #Ajouter l'utisateur au groupe administrateur
        sudo usermod -aG adm $user_name
        #Vérifier si l'utilisateur est bien dans le groupe demandé
        if groups $user_name
        then
            echo "L'utilisateur a bien été ajouté"
        fi
    else
        echo "L'utilisateur n'existe pas"
        exit 1
    fi
exit 0
}


#Fonction d'ajout à un groupe local
function adding_to_a_local_group ()
{
    #Demander le nom utilisateur
    echo "Quel utilisateur souhaitez-vous ajouter à un groupe?"
    read user_name

    #Vérifier si l'utilisateur existe
    if cat /etc/passwd | grep $user_name > /dev/null
    then
        #Demander le nom du groupe
        echo "Dans quel groupe souhaitez-vous l'ajouter?"
        read name_group
        #Ajouter l'utisateur au groupe
        sudo adduser $user_name $name_group
        #Vérifier si l'utilisateur est bien dans le groupe demandé
        if groups $user_name
        then
            echo "L'utilisateur a bien été ajouté"
        fi
    else
        echo "L'utilisateur n'existe pas"
        exit 1
    fi
exit 0
}


#Fonction de sortie d’un groupe local
function local_band_release ()
{
    #Demander le nom utilisateur
    echo "Quel utilisateur souhaitez-vous supprimer d'un groupe?"
    read user_name

    #Vérifier si l'utilisateur existe
    if cat /etc/passwd | grep $user_name > /dev/null
    then
        #Demander le nom du groupe
        echo "Dans quel groupe souhaitez-vous le supprimer?"
        read name_group
        #Suppression de l'utisateur du groupe
        sudo gpasswd -d $user_name $name_group

        #Vérifier si l'utilisateur est bien dans le groupe demandé
        if groups $user_name
        then
            echo "L'utilisateur a bien été supprimé"
        fi
    else
        echo "L'utilisateur n'existe pas"
        exit 1
    fi
exit 0
}


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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        lastdate_connexion;;
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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        lastdate_passwd;;
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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        open_user_session;;
    esac
}


#Fonction du groupe auquel appartient un utilisateur
function user_groups()
{
        clear
        echo "Voici le Groupe d'appartenance de l'utilisateur :"
        id -Gn $user
#OU	grep $user /etc/group
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_user_menu_choice ;;
    Non)
        exit 0 ;;
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        user_groups;;
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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        allcommand_user;;
    esac
}


#Fonction de visualisation des droits/permissions pour un utilisateur sur un dossier
function access_folder()
{
        clear
	cd ~/
	read -p "Entrez le nom d'un dossier sur lequel vous voulez voir les droits/permissions: " folder
        sudo find -type d -name "$folder"
    if [ ! -d "$folder" ]
    then
	read -p "le dossier n'existe pas, appuyer sur la touche [Entrée] pour continuer"
        access_folder
    else
        echo "Voici les droits/permissions de l'utilisateur sur ce dossier :"
        ls -ld $folder
        read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_user_menu_choice ;;
    Non)
        exit 0 ;;
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        access_folder;;
    esac
    fi
}


#Fonction de visualisation des droits/permissions pour un utilisateur sur un fichier
function access_file()
{
        clear
	cd ~/
        read -p "Entrez le nom d'un fichier sur lequel vous voulez voir les droits/permissions: " file
        sudo find -type f -name "$file"
    if [ ! -f "$file" ]
    then
        read -p "le fichier n'existe pas, appuyer sur la touche [Entrée] pour continuer"
        access_file
    else
        echo "Voici les droits/permissions de l'utilisateur sur ce fichier :"
        ls -l $file
        read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_user_menu_choice ;;
    Non)
        exit 0 ;;
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        access_file;;
    esac
    fi
}

#------------------------------------------------------------------------------------------------------------------
#				 Fonctions utilisées ACTIONS ORDINATEUR
#------------------------------------------------------------------------------------------------------------------
#Fonction Arrêt ordinateur
function computer_shutdown ()
{
    #Arrêt Machine
    echo "Confirmation arrêt machine (yes/no)"
    #Confirmation ou non de l'arrêt
    read choix

    case $choix in
        yes)
            echo "Confirmation arrêt machine"
            echo "Arrêt en cours"
            poweroff ;;
        no)
            echo "Annulation arrêt de la machine"
            echo "Pas d'arrêt" ;;
    esac
exit 0
}


#Fonction de redémarrage de l'ordinateur
function restart_computer ()
{
    #Redémarrage de la machine
    echo "Confirmation du redémarrage (yes/no)"
    #Lecture du choix de redémarrage
    read choix
    case $choix in
        yes)
            echo "Confirmation du redémarrage"
            echo "Redémarrage de la machine en cours"
            reboot ;;
        no)
            echo "Annulation du redémarrage"
            echo "Pas de redémarrage de la machine" ;;
    esac
exit 0
}


#Fonction de verrouillage #Redémarrage de la machine
function computer_lock ()
{
    #Verrouillage de la machine
    echo "Confirmation du verrouillage (yes/no)"
    #Lecture du choix de verrouillage
    read choix
    case $choix in
        yes)
            echo "Confirmation du verrouillage"
            echo "Verrouillage en cours"
            usermod -L ;;
        no)
            echo "Annulation du verrouillage"
            echo "Pas de verrouillage" ;;
    esac
exit 0
}


#Fonction de mise-à-jour du système
function system_update ()
{
    #Mise à jour du système
    echo "voulez-vous mettre à jour le système? (yes/no)"

    #Lecture choix de la mise à jour
    read choix
    case $choix in
        yes)
            echo "Mise à jour du système confirmée"
            echo "Mise à jour du systèeme en cours"
            sudo apt update ;;
        no)
            echo "Mise à jour du système avorté"
            echo "Pas de mise à jour" ;;
    esac
exit 0
}


#Fonction de création de répertoire
function directory_creation ()
{
    nom_du_repertoire=$nom_du_repertoire

    #Création d'un répertoire
    echo "Donner le nom du répertoire à créer"
    read nom_du_repertoire
    mkdir $nom_du_repertoire

    #Vérification de l'existence d'un répertoire du même nom
    if [ $? = 0 ]
    then
        echo "Le répertoire a été créer"
    else
        echo "Le répertoire existe déjà"
    fi
exit 0
}


#Fonction de modification de répertoire
function directory_modification ()
{
    #Nom du répertoire
    echo "Quel est le nom du répertoire à modifier?"
    read old_name
    #Nouveau nom du répertoire
    read new_name

    #Vérifier si le nouveau nom n'existe pas
    if [ -d "$new_name" ]
    then
        echo "Le nom du répertoire existe déjà"
    else
        mv "$old_name" "$new_name"
        echo "La modification du nom a bien été réaliser"
    fi
exit 0
}



#Fonctione de suppression de répertoire
function directory_deletion ()
{
    #Récupérer le nom du répertoire à supprimer
    echo "Quel est le répertoire à supprimer?"
    read nom_du_repertoire

    #Vérifier si le répertoire existe
    if [ -e $nom_du_repertoire ]
    then
        rm -r $nom_du_repertoire
        echo "Le répertoire a été supprimer"
    else
        echo "Le répertoire n'existe pas"
    fi
exit 0
}


#Fonction de prise de main à distance (CLI)
function remote_control ()
{
    #Demande utilisateur
    echo "Avec quel utilisateur souhaitez-vous être connecté?"
    read user

    #Demande sur quelle machine se connecter
    echo "Sur quelle machine souhaitez-vous être connectée?"
    read computer

    #Connection SSH
    ssh "$user"@"$computer"

exit 0
}


#Fonction d'activation du pare-feu
function enabling_the_firewall ()
{
    #Vérifier le status du pare-feu
    echo "Vérification status du pare-feu"
    sudo ufw status

    #Activation du pare-feu
    echo "Voulez-vous activer le pare-feu? (yes/no)"
    read choix

    case $choix in
    yes)
        echo "Activation du pare-feu en cours"
        sudo ufw enable
        echo "Pare-feu activé" ;;
    no)
        echo "Aucun pare-feu activé" ;;
    esac
exit 0
}


#Fonction de désactivation du pare-feu
function disabling_the_firewall ()
{
    #Vérifier le status du pare-feu
    echo "Vérification status du pare-feu"
    sudo ufw status

    #Désactivation du pare-feu
    echo "Voulez-vous désactiver le pare-feu? (yes/no)"
    read choix

    case $choix in
    yes)
        echo "Désactivation du pare-feu en cours"
        sudo ufw disable
        echo "Pare-feu désactivé" ;;
    no)
        echo "Aucun pare-feu désactivé" ;;
    esac
exit 0
}


#Fonction d'installation de logiciel
function software_installation ()
{
    #Demander le nom du logiiciel à installer
    echo "Quel logiciel souhaitez-vous installer?"
    read app

    #Installation du logiciel
    echo "Installation du logiciel en cours"
    sudo apt install $app
exit 0
}


#Fonction de désinstallation de logiciel
function_software_uninstallation ()
{
    #Demander quel logiciel est à désinstaller
    echo "Quel logiciel souhaitez-vous désinstaller?"
    read app

    #Lancer la désinstallation
    echo "Désinstallation du logiciel"
    sudo apt purge $app
exit 0
}


#Fonction d'exécution de script sur la machine distante
function script_execution_on_remote_machine ()
{
    #Demande nom utilisateur
    echo "Quel utilisateur souhaitez-vous connecté?"
    read user
    #Demande nom de la machine
    echo "Sur quelle machine souhaitez-vous être connectée?"
    read computer
    #Connection SSH
    ssh "$user"@"$computer"

    #Demande nom du script
    echo "Quel script souhaitez-vous exécuter? (Noter le chemin complet jusqu'au script)"
    read name_script

    #Exécution du script
    if [ -e $name_script ]
    then
        ./$name_script
    else
        echo "Le script n'existe pas"
        exit 1
    fi
exit 0
}


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
    *)
	read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
	os_version;;
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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        disk_number;;
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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        partition_info;;
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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        free_space;;
    esac
}


#Fonction nom et espace disque d'un dossier
function info_folder()
{
        clear
	cd ~/
	read -p "Entrez le nom d'un dossier sur lequel vous voulez des info ? " dossier
	sudo find -type d -name "$dossier"
        if [ ! -d "$dossier" ]
	then
	read -p "le dossier n'existe pas, appuyer sur la touche [Entrée] pour continuer"
	info_folder
	else
        echo "Voici le nom et l'espace disque du dossier :"
	du -sh ~/$dossier
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        info_folder;;
    esac
    fi
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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        mounted_drive_list;;
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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        pack_app_installed;;
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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        serv_progress;;
    esac
}


#Fonction liste des utilisateurs locaux
function local_users_list()
{
        clear
        echo "Voici la liste des utilisateurs locaux :"
        sudo cat /etc/passwd | grep "/home"
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        info_computer_menu_choice ;;
    Non)
        exit 0 ;;
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        local_users_list;;
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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        total_ram;;
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
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        ram_used;;
    esac
}



#-----------------------------------------------------------------------------------------------------------------
#                                Fonctions utilisées SCRIPT
#-----------------------------------------------------------------------------------------------------------------


function user_event ()
{
	clear
	echo "Voici les évènements de l'utilisateur : "
	cd /var/log
	journalctl --user
}






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