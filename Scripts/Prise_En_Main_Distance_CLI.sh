#!/bin/bash

#Demande utilisateur
echo "Avec quel utilisateur souhaitez-vous être connecté?"
read user

#Demande sur quelle machine se connecter
echo "Sur quelle machine souhaitez-vous être connectée?"
read computer

#Connection SSH
ssh "$user"@"$computer"

exit 0