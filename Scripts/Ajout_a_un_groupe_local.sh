#!/bin/bash

#Demander le nom utilisateur
echo "Quel utilisateur souhaitez-vous ajouter à un groupe?"
read user_name
#Vérifier si l'utilisateur existe
if cat /etc/passwd | grep $user_name > /dev/null
then
        #Demander le nom du groupe
        echo "Dans quel groupe souhaitez-vous l'ajouter?"
        read name_group
        #Ajouter l'utisateur au groupe
        sudo adduser $user_name $name_group
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