#!/bin/bash

#Donner le nom de l'utilisateur à Désactiver
echo "Donner le nom utilisateur à désacitver"
read $name_user

#Vérifier si l'utilisateur existe 
if cat /etc/passwd | grep "$name_user" > /dev/null
then
    #Désactiver l'utilisateur
    echo "Désactivation de l'utilisateur"
    sudo usermod -L
    echo "Utilisateur désactivé"
else
    #Problème de désactivation
    echo "Le nom utilisateur n'existe pas"
    exit 1
fi
exit 0