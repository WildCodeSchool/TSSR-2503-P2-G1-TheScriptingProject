#!/bin/bash

#Demander le nom utilisateur
echo "Quel utilisateur souhaitez-vous supprimer d'un groupe?"
read user_name
#Vérifier si l'utilisateur existe
if cat /etc/passwd | grep $user_name > /dev/null
then
        #Demander le nom du groupe
        echo "Dans quel groupe souhaitez-vous le supprimer?"
        read name_group
        #Suppression de l'utisateur du groupe
        sudo gpasswd -d $user_name $name_group
        #Vérifier si l'utilisateur est bien dans le groupe demandé
        if groups $user_name
        then
                echo "L'utilisateur a bien été supprimé"
        fi
else
        echo "L'utilisateur n'existe pas"
        exit 1
fi
exit 0