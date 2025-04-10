#!/bin/bash

#Vérifier le status du pare-feu
<<<<<<< HEAD
echo "Vérification status du pare-feu"
=======
echo "vérification du status du pare-feu"
>>>>>>> b0d93b40c28ab0a02f0fe186d501d4694d0b6043
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
