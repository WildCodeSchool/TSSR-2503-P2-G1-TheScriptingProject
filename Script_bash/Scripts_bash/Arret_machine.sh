#!/bin/bash

#Arrêt ordinateur

echo "Confirmationde de l'arrêt de l'ordinateur (yes/no)"
#Confirmation ou non de l'arrêt
read choix
case $choix in
    yes)
        echo "Confirmation de l'arrêt de l'ordinateur"
        echo "Arrêt en cours"
        poweroff ;;
    no)
        echo "Annulation de l'arrêt de l'ordinateur"
        echo "Pas d'arrêt" ;;
esac
exit 0
