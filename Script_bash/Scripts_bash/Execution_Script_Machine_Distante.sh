#!/bin/bash

#Demande nom utilisateur
echo "Quel utilisateur souhaitez-vous connecter?"
read user

#Demande nom de la machine
echo "Sur quelle machine souhaitez-vous être connectée?"
read computer

#Connection SSH
ssh "$user"@"$computer"

#Demande nom du script
echo "Quel script souhaitez-vous exécuter? (Noter le chemin complet jusqu'au script)"
read name_script

#Exécution du script 
if [ -e $name_script ]
then 
    ./$name_script
else
    echo "Le script n'existe pas"
    exit 1
fi
exit 0