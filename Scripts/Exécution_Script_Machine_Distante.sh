#!/bin/bash

#Demande nom utilisateur
echo "Quel utilisateur souhaitez-vous connecté?"
read user

#Demande nom de la machine
echo "Sur quelle machine souhaitez-vous être connectée?"
read computer

#Connection SSH
ssh "$user"@"$computer"

#Demande nom du script
echo "Quel script souhaitez-vous exécuter? (Noter le chemin complet jusqu'au script)"
read nameScript

#Exécution du script 
if [ -e $nameScript ]
then 
    ./$nameScript
else
    echo "Le script n'existe pas"
    exit 1
fi
exit 0