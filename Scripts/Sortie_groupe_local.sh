#!/bin/bash

#Demander le nom utilisateur
echo "Quel utilisateur souhaitez-vous supprimer d'un groupe?"
read userName
#Vérifier si l'utilisateur existe
if cat /etc/passwd | grep $userName > /dev/null
then
        #Demander le nom du groupe
        echo "Dans quel groupe souhaitez-vous le supprimer?"
        read nameGroup
        #Suppression de l'utisateur du groupe
        sudo gpasswd -d $userName $nameGroup
        #Vérifier si l'utilisateur est bien dans le groupe demandé
        if groups $userName
        then
                echo "L'utilisateur a bien été supprimé"
        fi
else
        echo "L'utilisateur n'existe pas"
        exit 1
fi
exit 0