#!/bin/bash

#Demander le nom du logiiciel à installer

echo "Quel logiciel souhaitez-vous installer?"
read app

#Installation du logiciel
echo "Installation du logiciel en cours"
sudo apt install $app