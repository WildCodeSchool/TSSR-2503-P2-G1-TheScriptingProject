#!/bin/bash

#Liste des sessions ouvertes par l'utilisateur

#nom d'utilisateur, terminal utilisé, date et heure de connexion, adresse IP (si connexion distante) et le PID du processus de connexion

who -u | grep linlab


# version plus détaillé avec : le temps de connexion, le temps d'inactivité, la charge CPU et la commande en cours d'exécution 
w -h | grep linlab
