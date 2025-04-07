#!/bin/bash

nomDuRepertoire=$nomDuRepertoire

#Création d'un répertoire
echo "Donner le nom du répertoire à créer"
read nomDuRepertoire
mkdir $nomDuRepertoire

#Vérification de l'existence d'un répertoire du même nom
if [ $? = 0 ]
then
    echo "Le répertoire a été créer"
else
    echo "Le répertoire existe déjà"
fi
exit 0
