#!/bin/bash

#Donner le nom de l'utilisateur à Désactiver
echo "Donner le nom utilisateur à désacitver"
read $name_user

#Vérifier si l'utilisateur existe 
if cat /etc/passwd | grep $name_user > /dev/null
then
    #Désactiver l'utilisateur
    echo "Désactivation de l'utilisateur"
    usermod -L
    
    #Vérifier la désactivation de l'utilisateur
    
