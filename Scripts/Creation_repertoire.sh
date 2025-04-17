#!/bin/bash

nom_du_repertoire=$nom_du_repertoire

#Création d'un répertoire
echo "Donner le nom du répertoire à créer"
read nom_du_repertoire
mkdir $nom_du_repertoire

#Vérification de l'existence d'un répertoire du même nom
if [ $? = 0 ]
then
    echo "Le répertoire a été créer"
else
    echo "Le répertoire existe déjà"
fi
exit 0
