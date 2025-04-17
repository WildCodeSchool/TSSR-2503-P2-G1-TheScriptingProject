#!/bin/bash
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
