#!/bin/bash

#Changement du mot de passe
echo "Entrer le nom de l'utilisateur"
read -p user_name

#Enregistrement du mot de passe
sudo passwd $user_name
exit 0