#!/bin/bash

#Donner le nom de l'utilisateur à supprimer
echo "Quel est le nom de l'utilisateur à supprimer?"
read user_name

#Vérifier l'existence de l'utilisateur
if cat /etc/passwd | grep $user_name > /dev/null
then
    echo "Suppression de l'utilisateur en cours"
    sudo userdel $user_name
    #Vérifier la suppression de l'utilisateur
    if cat etc/passwd | grep $user_name > /dev/null
    then
        echo "ERREUR utilisateur non supprimé"
    else 
        echo "L'utilisateur a bien été supprimer"
    fi 
else
    echo "L'utilisateur n'existe pas"
    echo "Aucun utilisateur supprimé"
    exit 1
fi 
exit 0