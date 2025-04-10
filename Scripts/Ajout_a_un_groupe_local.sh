#!/bin/bash

#Demander le nom utilisateur
echo "Quel utilisateur souhaitez-vous ajouter à un groupe?"
read userName
#Vérifier si l'utilisateur existe
if cat /etc/passwd | grep $userName > /dev/null
then
        #Demander le nom du groupe
        echo "Dans quel groupe souhaitez-vous l'ajouter?"
        read nameGroup
        #Ajouter l'utisateur au groupe
        sudo adduser $userName $nameGroup
        #Vérifier si l'utilisateur est bien dans le groupe demandé
        if groups $userName
        then
                echo "L'utilisateur a bien été ajouté"
        fi
else
        echo "L'utilisateur n'existe pas"
        exit 1
fi
exit 0