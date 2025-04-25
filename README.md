# The Scripting Project
![logo](https://github.com/user-attachments/assets/cfcae90c-67e7-4ff7-a2bd-ff665efd1d48)


---

## Sommaire 

- [🎯 Présentation générale du projet](#presentation-du-projet)
- [📜 Introduction](#introduction)
- [👥 Membres du groupe par sprint](#membres-du-groupe-par-sprint)
- [⚙️ Prérequis](#Prérequis)
- [🧗Difficultés rencontrées💡Solutions trouvées](#Difficultés-rencontrées-et-solutions-trouvées)
- [🚀 Améliorations possibles](#ameliorations-possibles)

---

## 🎯 Présentation générale du projet
<span id="presentation-du-projet"></span>

### Présentation

Notre projet consiste à créer deux scripts: L'un en Bash, l'autre en PowerShell.
Ces scripts doivent intérargir avec des machines distantes, que nous avons créés et mises en service sur un même réseau, afin d'éxécuter des commandes d'administration et recueillir des informations.


### Objectifs finaux

- Mettre en place une architecture client/serveur
- Créer et gérer des scripts Bash et PowerShell
- Développer des compétences en résolution de problèmes et en gestion de versions (Git)


## 📜 Introduction
<span id="introduction"></span>

Vous souhaitez avoir accès à une grande partie d'un ordinateur à distance sans avoir à parcourir l'intégralité de celui-ci alors vous êtes au bon endroit !
Ici, nous allons vous montrer qu'il est possible d'écrire un script (il y a deux scripts : Bash et PowerShell, mais tous petits les scripts... un peu plus de 1000 lignes chacun 🤪) et en l'exécutant, accédez à une grande partie des fonctionnalités d'une machine à distance. Que ce soit à propos de la machine en elle-même ou de l'utilisateur.

## 👥 Membres du groupe par sprint
<span id="membres-du-groupe-par-sprint"></span>



### Sprint 1

| Membre         | Rôle          | Missions                                                                   |
| -------------- | ------------- | -------------------------------------------------------------------------- |
|   Tatiana      | Product Owner |  Réflexion sur le projet et comment l'aborder, sur un squelette de script et début d'écriture script bash |
|   Lloyd        | Scrum Master  |  Réflexion sur le projet et comment l'aborder, sur un squelette de script et la connexion entre les machines |
|   John         | Technicien    |  Réflexion sur le projet et comment l'aborder, début d'écriture du squelette ainsi que les scripts bash |

### Sprint 2

| Membre         | Rôle          | Missions                                                                        |
| -------------- | ------------- | ------------------------------------------------------------------------------- |
|   John         | Scrum Master  | Attribuer les adresses IP aux machines ainsi que les noms.., écriture des scripts bash  |
|   Tatiana      | Technicien    | Attribuer les adresses IP aux machines ainsi que les noms.., écriture des scripts bash  |
|   Lloyd        | Product Owner | Attribuer les adresses IP aux machines ainsi que les noms.., début écriture scripts powershell |

### Sprint 3

| Membre         | Rôle          | Missions                                                                        |
| -------------- | ------------- | ------------------------------------------------------------------------------- |
|   Tatiana      | Scrum Master  |  Fin d'écriture des scripts bash, début des scripts powershell et mise en place des scripts bash dans le squelette |
|   Lloyd        | Technicien    |  Fin d'écriture des scripts bash, début des scripts powershell et mise en place des scripts bash dans le squelette |
|   John         | Product Owner |  Ecriture scripts powershell, Importation de la clé SSH et fin de la mise en forme du squelette |

### Sprint 4

| Membre         | Rôle          | Missions                                                                        |
| -------------- | ------------- | ------------------------------------------------------------------------------- |
|   John         | Scrum Master  | Ecriture du squeltte powershell, scripts powershell |
|   Tatiana      | Technicien    | Ecriture des scripts powershell et de la documentation |
|   Lloyd        | Product Owner | Importation des scripts au squelette, modifications, test  |

## ⚙️ Prérequis
<span id="Prérequis"></span>

- Compte Promox
- Machines Virtuelles (Nous avons mis en place 4machines virtuelles sur proxmox)
  > Ubuntu (Client)
  > Debian (Serveur)
  > Windows (Client)
  > Windows (Serveur)

- Configuration des machines pour que celles-ci soient accessibles à distance
- Connaissances en scripting bash et powershell

## 🧗 Difficultés rencontrées et 💡 Solutions trouvées
<span id="Difficultés-rencontrées-et-solutions-trouvées"></span>


|  [🧗Difficultés rencontrées](#difficultes-rencontrees)|[💡Solutions trouvées](#solutions-trouvees)|  
| --------------------------------------- | --------------------------------------- |
| Se projeter dans le projet et l'imaginer| Entraide principalement, réflexion      |
| Ecriture des scripts bash et powershell | Documentation, cours                    |
| Mise en place de la clef SSH            | Documentation, entraide et recherche    |
| Mise en place de WinRM                  |  Beaucoup de recherche et patience !    |
| Organisation du script, agencement, structure | Réflexion et entraîde du groupe |
| Adaptation à proxmox et création des machines | Temps de la prise en main et un super formateur!😁 |

## 🚀 Améliorations possibles
<span id="ameliorations-possibles"></span>

- Finir le script powershell
- Réaliser l'objectif secondaire avec un peu plus de temps
