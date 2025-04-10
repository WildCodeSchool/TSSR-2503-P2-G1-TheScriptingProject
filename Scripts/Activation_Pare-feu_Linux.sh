#!/bin/bash

#Vérifier le status du pare-feu
echo "Vérification status du pare-feu"
sudo ufw status

#Activation du pare-feu
echo "Voulez-vous activer le pare-feu? (yes/no)"
read Choix

case $Choix in 

yes)
    echo "Activation du pare-feu en cours"
    sudo ufw enable
    echo "Pare-feu activé" ;;
no)
    echo "Aucun pare-feu activé" ;;
esac
exit 0
