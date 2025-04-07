#!/bin/bash

#Verrouillage de la machine
echo "Confirmation du verrouillage (yes/no)"
#Lecture du choix de verrouillage
read Choix 
case $Choix in
    yes)
        echo "Confirmation du verrouillage"
        echo "Verrouillage en cours"
        usermod -L ;;
    no) 
        echo "Annulation du verrouillage"
        echo "Pas de verrouillage" ;;
esac
exit 0
