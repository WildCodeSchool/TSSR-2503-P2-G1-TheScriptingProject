#!/bin/bash

#Changement du mot de passe
echo "Entrer le nom de l'utilisateur"
read -p nom_utilisateur

#Enregistrement du mot de passe
sudo passwd $nom_utilisateur 
exit 0