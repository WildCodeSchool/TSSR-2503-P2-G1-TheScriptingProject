#!/bin/bash

clear
echo "Voici la version de l'OS :"
lsb_release -a

trigger=true
while $trigger -eq true; 
do
    read -p "vous voulez continuer ? [Oui/Non]" choix
    case $choix in
        Oui)
            echo "retour au menu précedent"
            read -p "appuyer sur la touche [Entrée] pour continuer" ;;
        Non)
            trigger=false ;;
        *)
	        read -p "Choix invalide, appuyer sur la touche [Entrée] pour continuer" ;;
    esac
done

