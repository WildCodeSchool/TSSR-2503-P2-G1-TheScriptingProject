#!/bin/bash

#Vérifier le status du pare-feu
echo "Vérification statut du pare-feu"
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
