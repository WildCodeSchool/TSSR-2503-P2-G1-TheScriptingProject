#!/bin/bash

#Nom du répertoire
echo "Quel est le nom du répertoire à modifier?"
read old_name
#Nouveau nom du répertoire
read new_name

#Vérifier si le nouveau nom n'existe pas
if [ -d "$new_name" ]
then
    echo "Le nom du répertoire existe déjà"
else
    mv "$old_name" "$new_name"
    echo "La modification du nom a bien été réaliser"
fi 
exit 0