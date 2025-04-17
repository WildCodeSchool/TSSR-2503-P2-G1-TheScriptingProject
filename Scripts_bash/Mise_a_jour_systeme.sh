#!/bin/bash

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
