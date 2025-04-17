#!/bin/bash

#Demande Nom du nouvel utilisateur à créer
echo " Quel est le nom du nouvel utilisateur?"
read new_user

#Vérifier si l'utilisateur existe déjà
if cat /etc/passwd | grep $new_user > /dev/null
then
    echo "L'utilisateur existe déjà"
    exit 1
else
    echo "Création du nouvel utilisateur"
    sudo useradd $newUSer > /dev/null

    #Vérifier si l'utilisateur a bien été créer
    if cat /etc/passwd | grep $new_user > /dev/null
    then
        echo "L'utilisateur a été créer"
    else
        echo "L'utilisateur n'a pas été créer = ERREUR"
    fi
fi 
exit 0