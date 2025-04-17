#!/bin/bash


#-----------------------------------------------------------------------------------------------------------------------------------------
#                                                 Fonctions sous sous-menu
#-----------------------------------------------------------------------------------------------------------------------------------------

#Fonction du sous Menu des actions utilisateur



#Fonction du sous Menu des informations utilisateur


#Fonction du sous Menu des actions Ordinateur






#Fonction du sous Menu des informations Ordinateur




#-------------------------------------------------------------------------------------------------------------------------------
#                                                     Fonction des sous menu
#------------------------------------------------------------------------------------------------------------------------------

#Fonction du Menu Utilisateur



#Fonction du Menu Ordinateur




#Fonction du Menu Script


function os_version() {
    
    ssh wilder@UBU02 < ./os_version.sh
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
        Oui)
            main_menu ;;
        Non)
            exit 0;;
        *)
	        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer" 
            os_version;;
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
		;;
	2)
        ;;
	3)
		;;
	*)
        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer"
	    main_menu ;;
	esac
}
main_menu