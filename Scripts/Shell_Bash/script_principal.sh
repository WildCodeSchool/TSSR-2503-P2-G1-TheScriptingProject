#!/bin/bash

ScriptUser=$(whoami)
Date=$(date +[%Y%m%d]-[%H%M%S])
DateSingle=$(date +"[%Y%m%d]")
LogFile=/var/log/log_evt.log
LogFolder=./log/

#----------------------------------------------------------------------------------------------------------------------
#				Fonctions d'initialisation
#----------------------------------------------------------------------------------------------------------------------

function Initialisation1 ()
{
    clear
    echo "===== Initialisation ====="
    sleep 1
    echo "Initialisation du dossier de log ..."
    if [ ! -e $LogFolder ]
    then
        sudo mkdir $LogFolder
    fi
    sleep 1
    echo "Initialisation du fichiers log_evt.log ..."
    if [ ! -e $LogFile ]
    then
        sudo touch $LogFile
    fi
    sleep 1
    echo "Vérification ..."
    echo "done"
    sleep 1
    clear
    echo "===== Bienvenu $ScriptUser ====="  
    echo ""
    echo "1. Client Ubuntu (CLILIN01)"
    echo "2. Client Windows (CLIWIN01) [WIP]"
    echo "3. Autre"
    echo "4. Quitter"
    echo ""
    read -p "Merci de choisir la machine cible : " Ini1
    case "$Ini1" in
        1)
            TargetComputeur=172.16.10.30
            Initialisation2
            ;;    
        3)
            read -p "Merci de rentrer l'adresse IP de la machine cible : " TargetComputeur
            Initialisation2
            ;;
        4)
            clear
            echo "Arret du script ..."
            sleep 1
            echo "Enregistrement des logs ..."
            sleep 1
            echo "Vérification ..."
            sleep 1
            echo "Nettoyage ..."
            echo ""
            echo "===== Script by : Tatiana, John et Lloyd ====="
            exit 0 ;;        
        *)
            read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
            Initialisation1   
            ;;
    esac
}

function Initialisation2 ()
{    
    clear
    echo "===== Bienvenu $ScriptUser ====="  
    echo ""
    echo "1. Wilder"
    echo "2. Autre"
    echo "3. Retour"
    echo ""
    read -p "Merci de choisir l'utilisateur cible : " Ini2
    case "$Ini2" in
        1)
            TargetUser=wilder
            echo "********StartScript********" >> $LogFile
            echo ""
            echo "Initialisation des variables ..."
            LogPc="[$TargetComputeur]-GEN$DateSingle".txt
            LogUser="[$TargetComputeur]_[$TargetUser]$DateSingle".txt 
            sleep 1
            echo "Préparation ..."
            sleep 1
            main_menu
            ;;
        2)
            read -p "Merci de rentrer le nom de l'utilisateur cible : " TargetUser
            echo "********StartScript********" >> $LogFile
            echo ""
            echo "Initialisation des variables ..."
            LogPc="[$TargetComputeur]-GEN$DateSingle".txt
            LogUser="[$TargetComputeur]_[$TargetUser]$DateSingle".txt 
            sleep 1
            echo "Préparation ..."
            sleep 1
            main_menu
            ;;
        3)
            Initialisation1 ;;
        *)
            read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
            Initialisation2
            ;;
    esac
}

#----------------------------------------------------------------------------------------------------------------------
#				Fonctions de boucle
#----------------------------------------------------------------------------------------------------------------------

function boucle ()
{
    clear
    echo "===== Tâche terminer ====="
    echo ""
    read -p "Vous voulez continuer ? [Oui/Non]" choix
    case $choix in
    Oui)
        main_menu ;;
    Non)
        clear
        echo "Arret du script ..."
        sleep 1
        echo "Enregistrement des logs ..."
        echo "*********EndScript*********" >> $LogFile
        sleep 1
        echo "Vérification ..."
        sleep 1
        echo "Nettoyage ..."
        echo ""
        echo "===== Script by : Tatiana, John et Lloyd ====="
        exit 0 ;;
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        boucle
        ;;
    esac
}

#----------------------------------------------------------------------------------------------------------------------
#				Fonctions utilisées ACTIONS UTILISATEUR
#----------------------------------------------------------------------------------------------------------------------

#Fonction de création de compte utilisateur local
function creating_a_local_user_account()
{
    #Demande Nom du nouvel utilisateur à créer
    clear
    echo "===== Création de compte utilisateur local ====="
    echo ""
    echo "Quel est le nom du nouvel utilisateur?"
    read new_user

    #Vérifier si l'utilisateur existe déjà
    if ssh "$TargetUser"@"$TargetComputeur" cat /etc/passwd | grep $new_user > /dev/null
    then
        echo "L'utilisateur existe déjà"
        echo "$Date-[$ScriptUser]-[Création de compte utilisateur local : $new_user]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    else
        echo "Création du nouvel utilisateur"
        ssh "$TargetUser"@"$TargetComputeur" sudo -S useradd $new_user > /dev/null
            #Vérifier si l'utilisateur a bien été créer
            if ssh "$TargetUser"@"$TargetComputeur" cat /etc/passwd | grep $new_user > /dev/null
            then
                echo "L'utilisateur a été créer"
                echo "$Date-[$ScriptUser]-[Création de compte utilisateur local : $new_user]-[$TargetUser@$TargetComputeur]-[Reussi]" >> $LogFile
                read -p "Appuyer sur la touche [Entrée] pour continuer"
                boucle
            else
                echo "ERREUR = L'utilisateur n'a pas été crée"
                echo "$Date-[$ScriptUser]-[Création de compte utilisateur local : $new_user]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
                read -p "Appuyer sur la touche [Entrée] pour continuer"
                boucle
            fi
    fi
}


#Fonction Changement de mot de passe
function change_password ()
{
    #Changement du mot de passe
    clear
    echo "===== Changement de mot de passe ====="
    echo ""
    echo "Entrer le nom de l'utilisateur"
    read user_name

    #Enregistrement du mot de passe
    ssh "$TargetUser"@"$TargetComputeur" sudo -S passwd $user_name
    echo "$Date-$ScriptUser-[Changement de mot de passe pour $user_name]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction de la suppression de compte utilisateur local
function deleting_a_local_user_account ()
{
    clear
    echo "===== Suppression de compte utilisateur local ====="
    echo ""
    echo "Quel est le nom de l'utilisateur à supprimer?"
    #Donner le nom de l'utilisateur à supprimer
    read user_name

    #Vérifier l'existence de l'utilisateur
    if ssh "$TargetUser"@"$TargetComputeur" cat /etc/passwd | grep $user_name > /dev/null
    then
        echo "Suppression de l'utilisateur en cours"
        ssh "$TargetUser"@"$TargetComputeur" sudo -S userdel $user_name

        #Vérifier la suppression de l'utilisateur
        if ssh "$TargetUser"@"$TargetComputeur" cat /etc/passwd | grep $user_name > /dev/null
        then
            echo "ERREUR = utilisateur non supprimé"
            echo "$Date-$ScriptUser-[Suppression de compte utilisateur local : $user_name]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle
        else
            echo "L'utilisateur a bien été supprimer"
            echo "$Date-$ScriptUser-[Suppression de compte utilisateur local : $user_name]-[$TargetUser@$TargetComputeur]-[Reussi]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle
        fi
    else
        echo "L'utilisateur n'existe pas"
        echo "Aucun utilisateur supprimé"
        echo "$Date-$ScriptUser-[Suppression de compte utilisateur local : $user_name]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    fi
}


#Fonction de la désactivation de compte utilisateur local
function local_user_account_deactivation ()
{
    clear
    echo "===== Désactivation de compte utilisateur local ====="
    echo ""
    #Donner le nom de l'utilisateur à Désactiver
    echo "Donner le nom utilisateur à désacitver"
    read name_user

    #Vérifier si l'utilisateur existe
    if ssh "$TargetUser"@"$TargetComputeur" cat /etc/passwd | grep "$name_user" > /dev/null
    then
        #Désactiver l'utilisateur
        echo "Désactivation de l'utilisateur"
        ssh "$TargetUser"@"$TargetComputeur" sudo -S usermod -L "$name_user"
        echo "Utilisateur désactivé"
        echo "$Date-$ScriptUser-[Désactivation de compte utilisateur local : $name_user]-[$TargetUser@$TargetComputeur]-[Reussi]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    else
        #Problème de désactivation
        echo "Le nom utilisateur n'existe pas"
        echo "$Date-$ScriptUser-[Désactivation de compte utilisateur local : $name_user]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    fi
}


#Fonction d'ajout à un groupe d'administration
function adding_to_an_administration_group ()
{
    clear
    echo "===== Ajout à un groupe d'administration ====="
    echo ""
    #Demander le nom utilisateur
    echo "Quel utilisateur souhaitez-vous ajouter au groupe administrateur?"
    read user_name

    #Vérifier si l'utilisateur existe
    if ssh "$TargetUser"@"$TargetComputeur" cat /etc/passwd | grep $user_name > /dev/null
    then
        #Ajouter l'utisateur au groupe administrateur
        ssh "$TargetUser"@"$TargetComputeur" sudo -S usermod -aG adm $user_name
        #Vérifier si l'utilisateur est bien dans le groupe demandé
        if ssh "$TargetUser"@"$TargetComputeur" id -nG $user_name | grep adm > /dev/null
        then
            echo "L'utilisateur a bien été ajouté"
            echo "$Date-$ScriptUser-[Ajout à un groupe d'administration : $user_name]-[$TargetUser@$TargetComputeur]-[Reussi]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle
        else
            echo "Erreur : L'utilisateur n'a pas été ajouté"
            echo "$Date-$ScriptUser-[Ajout à un groupe d'administration : $user_name]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle
        fi
    else
        echo "L'utilisateur n'existe pas"
        echo "$Date-$ScriptUser-[Ajout à un groupe d'administration : $user_name]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    fi
}


#Fonction d'ajout à un groupe local
function adding_to_a_local_group ()
{
    clear
    echo "===== Ajout à un group local ====="
    echo ""
    #Demander le nom utilisateur
    echo "Quel utilisateur souhaitez-vous ajouter à un groupe?"
    read user_name

    #Vérifier si l'utilisateur existe
    if ssh "$TargetUser"@"$TargetComputeur" cat /etc/passwd | grep $user_name > /dev/null
    then
        #Demander le nom du groupe
        echo "Dans quel groupe souhaitez-vous l'ajouter?"
        read name_group
        #Vérifier si le groupe existe
        if ssh "$TargetUser"@"$TargetComputeur" cat /etc/group | grep $name_group > /dev/null
        then
            #Ajouter l'utisateur au groupe
            ssh "$TargetUser"@"$TargetComputeur" sudo -S usermod -aG $name_group $user_name
            #Vérifier si l'utilisateur est bien dans le groupe demandé
            if ssh "$TargetUser"@"$TargetComputeur" id -nG "$user_name" | grep "$name_group" > /dev/null
            then
                echo "L'utilisateur a bien été ajouté"
                echo "$Date-$ScriptUser-[Ajout à un group local : $user_name dans $name_group ]-[$TargetUser@$TargetComputeur]-[Reussi]" >> $LogFile
                read -p "Appuyer sur la touche [Entrée] pour continuer"
                boucle
            else
                echo "Erreur : l'utilisateur na pas été ajouté"
                echo "$Date-$ScriptUser-[Ajout à un group local : $user_name dans $name_group ]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
                read -p "Appuyer sur la touche [Entrée] pour continuer"
                boucle
            fi
        else
            echo "Ce groupe n'existe pas"
            echo "$Date-$ScriptUser-[Ajout à un group local : $user_name dans $name_group ]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle
        fi
    else
        echo "L'utilisateur n'existe pas"
        echo "$Date-$ScriptUser-[Ajout à un group local : $user_name dans $name_group ]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    fi
}


#Fonction de sortie d’un groupe local
function local_band_release ()
{
    clear
    echo "===== Sortie d'un groupe local ====="
    echo ""
    #Demander le nom utilisateur
    echo "Quel utilisateur souhaitez-vous supprimer d'un groupe?"
    read user_name

    #Vérifier si l'utilisateur existe
    if ssh "$TargetUser"@"$TargetComputeur" cat /etc/passwd | grep $user_name > /dev/null
    then
        #Demander le nom du groupe
        echo "Dans quel groupe souhaitez-vous le supprimer?"
        read name_group
        #Suppression de l'utisateur du groupe
        #Vérifier si l'utilisateur est bien dans le groupe demandé
        if ssh "$TargetUser"@"$TargetComputeur" id -nG $user_name | grep $name_group > /dev/null
        then
            ssh "$TargetUser"@"$TargetComputeur" sudo -S gpasswd -d $user_name $name_group
            if ssh "$TargetUser"@"$TargetComputeur" id -nG $user_name | grep $name_group > /dev/null
            then
                echo "Erreur : l'utilisateur n'a pas étét supprimé du groupe"
                echo "$Date-$ScriptUser-[Sortie d'un groupe local : $user_name dans $name_group]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
                read -p "Appuyer sur la touche [Entrée] pour continuer"
                boucle

            else
                echo "L'utilisateur a bien été supprimé du groupe"
                echo "$Date-$ScriptUser-[Sortie d'un groupe local : $user_name dans $name_group]-[$TargetUser@$TargetComputeur]-[Reussi]" >> $LogFile
                read -p "Appuyer sur la touche [Entrée] pour continuer"
                boucle
            fi
        else
            echo "L'utilisateur n'est pas dans ce groupe"
            echo "$Date-$ScriptUser-[Sortie d'un groupe local : $user_name dans $name_group]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle
        fi
    else
        echo "L'utilisateur n'existe pas"
        echo "$Date-$ScriptUser-[Sortie d'un groupe local : $user_name dans $name_group]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    fi
}


#----------------------------------------------------------------------------------------------------------------------
#				 Fonctions utilisées INFORMATIONS UTILISATEUR
#----------------------------------------------------------------------------------------------------------------------
#Fonction de dernière connexion
function lastdate_connexion()
{
    clear
    echo "===== Date de dernière connexion ====="
    echo ""
    echo "Voici la date de dernière connexion :"
    ssh "$TargetUser"@"$TargetComputeur" last -1 $TargetUser
    ssh "$TargetUser"@"$TargetComputeur" last -1 $TargetUser > $LogFolder$LogUser 
    echo "$Date-$ScriptUser-[Date de dernière connexion : $TargetUser]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction de dernière modification de mot de passe
function lastdate_passwd()
{
    clear
    echo "===== Date de dernière modification de mot de passe ====="
    echo ""
    echo "Voici la dernière date de modification de mot de passe :"
    ssh "$TargetUser"@"$TargetComputeur" passwd -S
    ssh "$TargetUser"@"$TargetComputeur" passwd -S > $LogFolder$LogUser
    echo "$Date-$ScriptUser-[Date de dernière modification de mot de passe de $TargetUser]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction de la liste des session ouvertes par un utilisateur
function open_user_session()
{
    clear
    echo "===== Liste des session ouvertes par l'utilisateur ====="
    echo ""
    echo "Voici la liste des sessions ouvertes par l'utilisateur :"
    ssh "$TargetUser"@"$TargetComputeur" who -u | grep "$TargetUser"
    ssh "$TargetUser"@"$TargetComputeur" who -u | grep "$TargetUser" > $LogFolder$LogUser
    echo "$Date-$ScriptUser-[Liste des session ouvertes par l'utilisateur $TargetUser]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction du groupe auquel appartient un utilisateur
function user_groups()
{
    clear
    echo "===== Groupe d'appertenance d'un utilisateur ====="
    echo ""
    echo "Voici le Groupe d'appartenance de l'utilisateur :"
    ssh "$TargetUser"@"$TargetComputeur" id -Gn $TargetUser
    ssh "$TargetUser"@"$TargetComputeur" id -Gn $TargetUser > $LogFolder$LogUser
    echo "$Date-$ScriptUser-[Groupe d'appertenance d'un utilisateur : $TargetUser]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction de l'historique des commandes exécutées par un utilisateur
function allcommand_user()
{
    clear
    echo "===== Historique des commandes exécutées par l'utilisateur ====="
    echo ""
    echo "Voici l'historique des commandes exécutées par l'utilisateur :"
    ssh "$TargetUser"@"$TargetComputeur" cat /home/"$TargetUser"/.bash_history
    ssh "$TargetUser"@"$TargetComputeur" cat /home/"$TargetUser"/.bash_history > $LogFolder$LogUser
    echo "$Date-$ScriptUser-[Historique des commandes exécutées par l'utilisateur $TargetUser]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction de visualisation des droits/permissions pour un utilisateur sur un dossier
function access_folder()
{
    clear
    echo "===== Droits/permissions de l'utilisateur sur un dossier ====="
    echo ""
	read -p "Entrez le chemin complet d'un dossier sur lequel vous voulez voir les droits/permissions : " folder
    folderPath=$(ssh "$TargetUser"@"$TargetComputeur" sudo -S find -type d -name "$folder")
    ssh "$TargetUser"@"$TargetComputeur" test -d "$folderPath"
    if [ $? -eq 0 ]
    then
	    echo "Voici les droits/permissions de l'utilisateur sur ce dossier :"
        ssh "$TargetUser"@"$TargetComputeur" ls -ld $folderPath
        ssh "$TargetUser"@"$TargetComputeur" ls -ld $folderPath > $LogFolder$LogUser
        echo "$Date-$ScriptUser-[Droits/permissions de l'utilisateur $TargetUser sur un dossier]-[$TargetUser@$TargetComputeur]-[Reussi]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    else
        read -p "le dossier n'existe pas, appuyer sur la touche [Entrée] pour continuer"
        echo "$Date-$ScriptUser-[Droits/permissions de l'utilisateur $TargetUser sur un dossier]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
        boucle
    fi
}


#Fonction de visualisation des droits/permissions pour un utilisateur sur un fichier
function access_file()
{
    clear
    echo "===== Droits/permissions de l'utilisateur sur un fichier ====="
    echo ""
    read -p "Entrez le nom d'un fichier sur lequel vous voulez voir les droits/permissions: " file
    filePath=$(ssh "$TargetUser"@"$TargetComputeur" sudo -S find -type f -name "$file")
    ssh "$TargetUser"@"$TargetComputeur" test -f "$filePath"
    if [ $? -eq 0 ]
    then
        echo "Voici les droits/permissions de l'utilisateur sur ce fichier :"
        ssh "$TargetUser"@"$TargetComputeur" ls -l $filePath
        ssh "$TargetUser"@"$TargetComputeur" ls -l $filePath > $LogFolder$LogUser
        echo "$Date-$ScriptUser-[Droits/permissions de l'utilisateur $TargetUser sur un fichier]-[$TargetUser@$TargetComputeur]-[Reussi]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    else
        read -p "le fichier n'existe pas, appuyer sur la touche [Entrée] pour continuer"
        echo "$Date-$ScriptUser-[Droits/permissions de l'utilisateur $TargetUser sur un fichier]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle        
    fi
}

#------------------------------------------------------------------------------------------------------------------
#				 Fonctions utilisées ACTIONS ORDINATEUR
#------------------------------------------------------------------------------------------------------------------
#Fonction Arrêt ordinateur
function computer_shutdown ()
{
    clear
    echo "===== Arrêt ordinateur ====="
    echo ""
    #Arrêt Machine
    echo "Confirmation arrêt machine (yes/no)"
    #Confirmation ou non de l'arrêt
    read choix

    case $choix in
        yes)
            ssh "$TargetUser"@"$TargetComputeur" sudo -S shutdown now
            echo "Confirmation arrêt machine"
            echo "Arrêt en cours"
            echo "$Date-$ScriptUser-[Arrêt ordinateur]-[$TargetUser@$TargetComputeur]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle ;;
        no)
            echo "Annulation arrêt de la machine"
            echo "Pas d'arrêt" 
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle ;;
        *)
            read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
            computer_shutdown ;;
    esac
}


#Fonction de redémarrage de l'ordinateur
function restart_computer ()
{
    clear
    echo "===== Redémarrage ordinateur ====="
    echo ""
    #Redémarrage de la machine
    echo "Confirmation du redémarrage (yes/no)"
    #Lecture du choix de redémarrage
    read choix
    case $choix in
        yes)
            echo "Confirmation du redémarrage"
            echo "Redémarrage de la machine en cours"
            ssh "$TargetUser"@"$TargetComputeur" sudo -S reboot 
            echo "$Date-$ScriptUser-[Redémarrage ordinateur]-[$TargetUser@$TargetComputeur]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle ;;
        no)
            echo "Annulation du redémarrage"
            echo "Pas de redémarrage de la machine" 
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle;;
        *)
            read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
            restart_computer ;;
    esac
}


#Fonction de verrouillage de l'ordinateur
function computer_lock ()
{
    clear
    echo "===== Verrouillage ordinateur ====="
    echo ""
    #Verrouillage de la machine
    echo "Confirmation du verrouillage (yes/no)"
    #Lecture du choix de verrouillage
    read choix
    case $choix in
        yes)
            echo "Confirmation du verrouillage"
            echo "Verrouillage en cours"
            ssh "$TargetUser"@"$TargetComputeur" dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock 
            echo "$Date-$ScriptUser-[Verrouillage ordinateur]-[$TargetUser@$TargetComputeur]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle ;;
        no)
            echo "Annulation du verrouillage"
            echo "Pas de verrouillage" 
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle ;;
        *)
            read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
            computer_lock ;;
    esac
}


#Fonction de mise-à-jour du système
function system_update ()
{
    clear
    echo "===== Mise-à-jour du système ====="
    echo ""
    #Mise à jour du système
    echo "voulez-vous mettre à jour le système? (yes/no)"
    #Lecture choix de la mise à jour
    read choix
    case $choix in
        yes)
            echo "Mise à jour du système confirmée"
            echo "Mise à jour du système en cours"
            ssh "$TargetUser"@"$TargetComputeur" sudo -S apt update && ssh "$TargetUser"@"$TargetComputeur" sudo -S apt upgrade -y 
            echo "$Date-$ScriptUser-[Mise-à-jour du système]-[$TargetUser@$TargetComputeur]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle ;;
        no)
            echo "Mise à jour du système avorté"
            echo "Pas de mise à jour" 
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle ;;
        *)
            read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
            boucle ;;
    esac
}


#Fonction de création de répertoire
function directory_creation ()
{
    clear
    echo "===== Création de répertoire ====="
    echo ""
    #Création d'un répertoire
    read -p "Indiquez le chemin complet où créer le répertoire : " folderPath
    ssh "$TargetUser"@"$TargetComputeur" test -d "$folderPath"
    if [ $? -eq 0 ] 
    then
        read -p "Donnez le nom du répertoire à créer : " folderName
        ssh "$TargetUser"@"$TargetComputeur" mkdir "$folderPath"/"$folderName" 2> /dev/null
        if [ $? -eq 0 ]
        then
            echo "Répertoire $folderName créé."
            echo "$Date-$ScriptUser-[Création de répertoire $folderPath"/"$folderName]-[$TargetUser@$TargetComputeur]-[Reussi]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle
        else
            echo "Impossible de créé le répertoire $folderName : un répertoire avec le même nom existe déjà."
            echo "$Date-$ScriptUser-[Création de répertoire $folderPath"/"$folderName]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle
        fi 
    else
        echo "Erreur : Ce chemin n'existe pas"
        echo "$Date-$ScriptUser-[Création de répertoire $folderPath"/"$folderName]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    fi
}


#Fonction de modification de répertoire
function directory_modification ()
{
    clear
    echo "===== Modification de répertoire ====="
    echo ""
    read -p "Indiquer le chemin complet du répertoire à modifier : " folderPath
    read -p "Donner le nom du répertoire à modifier : " folderName
    ssh "$TargetUser"@"$TargetComputeur" test -d "$folderPath/$folderName"
    if [ $? -eq 0 ] 
    then
        #Nouveau nom du répertoire
        read -p "Indiquer le nouveau nom du répertoire $folderName : " folderNewName
        ssh "$TargetUser"@"$TargetComputeur" test -d "$folderPath/$folderNewName"
        if [ $? -eq 0 ]
        then
            echo "Erreur = ce répertoire existe déja"
            echo "$Date-$ScriptUser-[Modification de répertoire $folderPath/$folderNewName]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle
        else
            ssh "$TargetUser"@"$TargetComputeur" mv "$folderPath/$folderName" "$folderPath/$folderNewName"
            echo "Répertoire modifier"
            echo "$Date-$ScriptUser-[Modification de répertoire $folderPath/$folderNewName]-[$TargetUser@$TargetComputeur]-[Reussi]" >> $LogFile
            read -p "Appuyer sur la touche [Entrée] pour continuer"
            boucle
        fi
    else
        echo "Le répertoire indiquer n'existe pas"
        echo "$Date-$ScriptUser-[Modification de répertoire $folderPath/$folderNewName]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    fi
}



#Fonctione de suppression de répertoire
function directory_deletion ()
{
    clear
    echo "===== Suppression de répertoire ====="
    echo ""
    #Récupérer le nom du répertoire à supprimer
    echo "Attention : tous les fichiers et dossiers contenu dans le répertoire sera supprimer !"
    read -p "Indiquer le chemin complet du répertoire à supprimer : " folderPath
    read -p "Donner le nom du répertoire à supprimer : " folderName
    ssh "$TargetUser"@"$TargetComputeur" test -d "$folderPath/$folderName"
    #Vérifier si le répertoire existe
    if [ $? -eq 0 ]
    then
        ssh "$TargetUser"@"$TargetComputeur" rm -r "$folderPath/$folderName"
        echo "Le répertoire a été supprimer"
        echo "$Date-$ScriptUser-[Suppression de répertoire $folderPath/$folderName]-[$TargetUser@$TargetComputeur]-[Reussi]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    else
        echo "Le répertoire n'existe pas"
        echo "$Date-$ScriptUser-[Suppression de répertoire $folderPath/$folderName]-[$TargetUser@$TargetComputeur]-[Echec]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    fi
}


#Fonction de prise de main à distance (CLI)
function remote_control ()
{
    clear
    echo "===== Prise de main à distance (CLI) ====="
    echo ""
    echo "Rappel : pour quitter la prise de main à distance, tapper 'exit' dans le terminal"
    echo "Connexion en cour ..."
    ssh "$TargetUser"@"$TargetComputeur"
    echo "$Date-$ScriptUser-[Prise de main à distance (CLI)]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction d'activation du pare-feu
function enabling_the_firewall ()
{
    clear
    echo "===== Activation du Pare-feu ====="
    echo ""
    #Vérifier le status du pare-feu
    echo "Vérification status du pare-feu"
    ssh "$TargetUser"@"$TargetComputeur" sudo -S ufw status

    #Activation du pare-feu
    read -p  "Voulez-vous activer le pare-feu? (yes/no)" choix
    case $choix in
    yes)
        echo "Activation du pare-feu en cours"
        ssh "$TargetUser"@"$TargetComputeur" sudo -S ufw enable
        echo "Pare-feu activé"
        echo "$Date-$ScriptUser-[Activation du Pare-feu]-[$TargetUser@$TargetComputeur]" >> $LogFile 
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle ;;
    no)
        echo "Aucun pare-feu activé" 
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle ;;
    *)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
        boucle ;;    
    esac
}


#Fonction de désactivation du pare-feu
function disabling_the_firewall ()
{
    clear
    echo "===== Désactivation du Pare-feu ====="
    echo ""
    #Vérifier le status du pare-feu
    echo "Vérification status du pare-feu"
    ssh "$TargetUser"@"$TargetComputeur" sudo -S ufw status

    #Désactivation du pare-feu
    read -p "Voulez-vous désactiver le pare-feu? (yes/no)" choix
    case $choix in
    yes)
        echo "Désactivation du pare-feu en cours"
        ssh "$TargetUser"@"$TargetComputeur" sudo -S ufw disable
        echo "Pare-feu désactivé"
        echo "$Date-$ScriptUser-[Désactivation du Pare-feu]-[$TargetUser@$TargetComputeur]" >> $LogFile 
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle;;
    no)
        echo "Aucun pare-feu désactivé" 
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle;;
    esac
}


#Fonction d'installation de logiciel
function software_installation ()
{
    clear
    echo "===== Installation de logiciel ====="
    echo ""
    #Demander le nom du logiiciel à installer
    read -p "Quel logiciel souhaitez-vous installer? " app

    #Installation du logiciel
    echo "Installation du logiciel en cours"
    ssh "$TargetUser"@"$TargetComputeur" sudo -S apt install $app
    echo "$Date-$ScriptUser-[Installation de logiciel $app]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction de désinstallation de logiciel
function software_uninstallation ()
{
    clear
    echo "===== Désinstallation de logiciel ====="
    echo ""
    #Demander quel logiciel est à désinstaller
    read -p "Quel logiciel souhaitez-vous désinstaller? " app

    #Lancer la désinstallation
    echo "Désinstallation du logiciel"
    ssh "$TargetUser"@"$TargetComputeur" sudo -S apt purge $app
    echo "$Date-$ScriptUser-[Désinstallation de logiciel $app]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction d'exécution de script sur la machine distante
function script_execution_on_remote_machine ()
{
    clear
    echo "===== Exécution de script sur la machine distante ====="
    echo ""
    #Demande nom du script
    read -p "Quel script souhaitez-vous exécuter ? " name_script
    read -p "Indiquer le chemin complet du script " path_script
    ssh "$TargetUser"@"$TargetComputeur" test -f $path_script/$name_script
    #Exécution du script
    if [ $? -eq 0 ]
    then   
        ssh "$TargetUser"@"$TargetComputeur" bash $path_script/$name_script
        echo "$Date-$ScriptUser-[Exécution de script sur la machine distante $path_script/$name_script ]-[$TargetUser@$TargetComputeur]" >> $LogFile
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    else
        echo "Le script n'existe pas"
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    fi
}


#-----------------------------------------------------------------------------------------------------------------
#				 Fonctions utilisées INFORMATIONS ORDINATEUR
#-----------------------------------------------------------------------------------------------------------------

#Fonction version de l'OS
function os_version()
{
	clear
    echo "===== Version de l'OS ====="
    echo ""
	echo "Voici la version de l'OS :"
	ssh "$TargetUser"@"$TargetComputeur" lsb_release -a
    ssh "$TargetUser"@"$TargetComputeur" lsb_release -a > $LogFolder$LogPc
    echo "$Date-$ScriptUser-[Version de l'OS]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction nombre de disque
function disk_number()
{
    clear
    echo "===== Nombre de disque ====="
    echo ""
    echo "Voici le nombre de disque :"
    ssh "$TargetUser"@"$TargetComputeur" lsblk -n | grep -v "loop*" | grep -v "part" | wc -l
    ssh "$TargetUser"@"$TargetComputeur" lsblk -n | grep -v "loop*" | grep -v "part" | wc -l > $LogFolder$LogPc
    echo "$Date-$ScriptUser-[Nombre de disque]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction info partition
function partition_info()
{
    clear
    echo "===== Partition par disque ====="
    echo ""
    echo "Voici le détail des partitions :"
    ssh "$TargetUser"@"$TargetComputeur" lsblk -o NAME,SIZE,TYPE,FSTYPE,FSUSE%,MOUNTPOINTS | grep -v "loop*"
    ssh "$TargetUser"@"$TargetComputeur" lsblk -o NAME,SIZE,TYPE,FSTYPE,FSUSE%,MOUNTPOINTS | grep -v "loop*" > $LogFolder$LogPc
    echo "$Date-$ScriptUser-[Partition par disque]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction espace disque restant
function free_space()
{
    clear
    echo "===== Espace disque restant par partition/volume ====="
    echo ""
    echo "Voici l'espace disque restant :"
    ssh "$TargetUser"@"$TargetComputeur" df -h | grep -v "tmpfs"
    ssh "$TargetUser"@"$TargetComputeur" df -h | grep -v "tmpfs" > $LogFolder$LogPc
    echo "$Date-$ScriptUser-[Espace disque restant par partition/volume]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction nom et espace disque d'un dossier
function info_folder()
{
    clear
    echo "===== Nom et espace disque d'un dossier ====="
    echo ""
	read -p "Indiquer le chemin complet du répertoire : " folderPath
    read -p "Donner le nom du répertoire à supprimer : " folderName
	ssh "$TargetUser"@"$TargetComputeur" test -d "$folderPath/$folderName"
    if [ $? -eq 0 ]
	then
	    echo "Voici le nom et l'espace disque du dossier :"
	    ssh "$TargetUser"@"$TargetComputeur" du -sh "$folderPath/$folderName"
        ssh "$TargetUser"@"$TargetComputeur" du -sh "$folderPath/$folderName" > $LogFolder$LogPc
        echo "$Date-$ScriptUser-[Nom et espace disque d'un dossier $folderPath/$folderName]-[$TargetUser@$TargetComputeur]" >> $LogFile    
        read -p "Appuyer sur la touche [Entrée] pour continuer"
    else
        read -p "le dossier indiquer n'existe pas"
        read -p "Appuyer sur la touche [Entrée] pour continuer"
        boucle
    fi
}


#Fonction liste des lecteurs montés
function mounted_drive_list()
{
    clear
    echo "===== Liste des lecteurs monté ====="
    echo ""
    echo "Voici la liste des lecteurs montés :"
    ssh "$TargetUser"@"$TargetComputeur" findmnt
    ssh "$TargetUser"@"$TargetComputeur" findmnt > $LogFolder$LogPc
    echo "$Date-$ScriptUser-[Liste des lecteurs monté]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction liste des applications/paquets installées
function pack_app_installed()
{
    clear
    echo "===== Liste des application/paquets installées ====="
    echo ""
    echo "Voici la liste des applications/paquets installées :"
    ssh "$TargetUser"@"$TargetComputeur" apt --installed list
    ssh "$TargetUser"@"$TargetComputeur" apt --installed list > $LogFolder$LogPc
    echo "$Date-$ScriptUser-[Liste des application/paquets installées]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction liste des services en cours d'exécution
function serv_progress()
{
    clear
    echo "===== Liste des services en cours d'execution ====="
    echo ""
    echo "Voici la liste des services en cours d'exécution :"
    ssh "$TargetUser"@"$TargetComputeur" systemctl list-units --type=service
    ssh "$TargetUser"@"$TargetComputeur" systemctl list-units --type=service > $LogFolder$LogPc
    echo "$Date-$ScriptUser-[Liste des services en cours d'execution]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction liste des utilisateurs locaux
function local_users_list()
{
    clear
    echo "===== Liste des utilisateur locaux ====="
    echo ""
    echo "Voici la liste des utilisateurs locaux :"
    ssh "$TargetUser"@"$TargetComputeur" sudo -S cat /etc/passwd | grep "/home"
    ssh "$TargetUser"@"$TargetComputeur" sudo -S cat /etc/passwd | grep "/home" > $LogFolder$LogPc
    echo "$Date-$ScriptUser-[Liste des utilisateur locaux]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction mémoire RAM totale
function total_ram()
{
    clear
    echo "===== Mémoire RAM totale ====="
    echo ""
    echo "Voici la mémoire RAM total :"
    ssh "$TargetUser"@"$TargetComputeur" lshw -c memory | grep taille
    ssh "$TargetUser"@"$TargetComputeur" lshw -c memory | grep taille > $LogFolder$LogPc
    echo "$Date-$ScriptUser-[Mémoire RAM totale]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}


#Fonction utilisation de la RAM
function ram_used()
{
    clear
    echo "===== Utilisation de la RAM ====="
    echo ""
    echo "Voici la mémoire RAM total :"
    ssh "$TargetUser"@"$TargetComputeur" free -h
    ssh "$TargetUser"@"$TargetComputeur" free -h > $LogFolder$LogPc
    echo "$Date-$ScriptUser-[Utilisation de la RAM]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}



#-----------------------------------------------------------------------------------------------------------------
#                                Fonctions utilisées SCRIPT
#-----------------------------------------------------------------------------------------------------------------


function user_event ()
{
	clear
    echo "===== Recherche des évènements pour un utilisateur ====="
    echo ""
	echo "Voici les évènements de l'utilisateur $TargetUser : "
	cat $LogFile | grep "$TargetUser"
    echo "$Date-$ScriptUser-[Recherche des évènements pour un utilisateur $TargetUser]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
}

function computer_event ()
{
    clear
    echo "===== Recherche des évènements pour un ordinateur ====="
    echo ""
	echo "Voici les évènements de l'utilisateur $TargetComputeur : "
	cat $LogFile | grep "$TargetComputeur"
    echo "$Date-$ScriptUser-[Recherche des évènements pour un ordinateur $TargetComputeur]-[$TargetUser@$TargetComputeur]" >> $LogFile
    read -p "Appuyer sur la touche [Entrée] pour continuer"
    boucle
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
       	script_execution_on_remote_machine;;
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
    echo "1. Une Action"
    echo "2. Une Information"
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
    echo "1. Une Action"
    echo "2. Une Information"
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
    echo "4. Retour"
    echo "5. Quitter"
	echo "                          "
	read -p "Choisissez votre cible : " main_choice

	case $main_choice in
	1)
		user_menu;;
	2)
        computer_menu;;
	3)
		script_menu;;
    4) 
        Initialisation2 ;;
    5)
        clear
        echo "Arret du script ..."
        sleep 1
        echo "Enregistrement des logs ..."
        echo "*********EndScript*********" >> $LogFile
        sleep 1
        echo "Vérification ..."
        sleep 1
        echo "Nettoyage ..."
        echo ""
        echo "===== Script by : Tatiana, John et Lloyd ====="
        exit 0 ;;        
	*)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
	    main_menu;;
	esac
}

Initialisation1