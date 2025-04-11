#!/bin/bash

#Demande le nom du logiciel à installer
echo "Quel logiciel souhaitez-vous installer?"
read app

#Installation du logiciel
echo "Installation du logiciel"
sudo apt install snap
sudo apt install $app