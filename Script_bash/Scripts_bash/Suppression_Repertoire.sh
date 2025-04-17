#!/bin/bash

#Récupérer le nom du répertoire à supprimer
echo "Quel est le répertoire à supprimer?"
read nom_du_rpertoire

#Vérifier si le répertoire existe
if [ -e $nom_du_rpertoire ]
then 
    rm -r $nom_du_rpertoire
    echo "Le répertoire a été supprimer"
else
    echo "Le répertoire n'existe pas"
fi 
exit 0