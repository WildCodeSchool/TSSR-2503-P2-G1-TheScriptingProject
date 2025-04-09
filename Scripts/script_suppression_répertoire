#!/bin/bash

#Récupérer le nom du répertoire à supprimer
echo "Quel est le répertoire à supprimer?"
read nomDuRepertoire

#Vérifier si le répertoire existe
if [ -e $nomDuRepertoire ]
then 
    rm -r $nomDuRepertoire
    echo "Le répertoire a été supprimer"
else
    echo "Le répertoire n'existe pas"
fi 
exit 0