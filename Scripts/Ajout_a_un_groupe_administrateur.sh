#!/bin/bash

#Demander le nom utilisateur
echo "Quel utilisateur souhaitez-vous ajouter au groupe administrateur?"
read userName
#Vérifier si l'utilisateur existe
if cat /etc/passwd | grep $userName > /dev/null
then
        #Ajouter l'utisateur au groupe administrateur
        sudo usermod -aG adm $userName
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