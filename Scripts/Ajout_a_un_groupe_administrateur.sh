#!/bin/bash

#Demander le nom utilisateur
echo "Quel utilisateur souhaitez-vous ajouter au groupe administrateur?"
read userName
#Vérifier si l'utilisateur existe
if cat /etc/passwd | grep $user_name > /dev/null
then
        #Ajouter l'utisateur au groupe administrateur
        sudo usermod -aG adm $user_name
        #Vérifier si l'utilisateur est bien dans le groupe demandé
        if groups $user_name
        then
                echo "L'utilisateur a bien été ajouter"
        fi
else
        echo "L'utilisateur n'existe pas"
        exit 1
fi
exit 0