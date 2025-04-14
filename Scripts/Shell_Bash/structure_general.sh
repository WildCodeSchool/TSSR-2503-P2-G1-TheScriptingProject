#!/bin/bash

################################################################################
#Liste des Variable - Ont va déclarer toutes les variables utile à notre script# 
################################################################################

variable1=value
variable2=value
variable3=value
# etc.

################################################################################
# Fonction - Ont va faire toutes nos fonction (nos Actions) utile au scripte   # 
################################################################################

function nom1()
{
   instructions
}

function nom2()
{
   instructions
}

function menu_principal()
{
   read -p "Faite votre choix : " choix
   case $choix in
   choix1)
       echo nom1
       nom1;;
   choix2)
       echo nom2;;
   choix3)
       echo nom3;;
   Retour)
      menu_principal;;
   *)
      echo "Erreur choix";;
    esac
}
#etc.

################################################################################
# Case - Ont va faire le Case (le menus des choix) de notre scripte            # 
################################################################################ 

menu_principal

#nombre de choix à definir

exit 0