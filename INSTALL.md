# Sommaire

1. [Prérequis technique](#prerequis-technique)
2. [Installation](#installation)
3. [FAQ](#faq)

# 1. Prérequis techniques
<span id="prerequis-techniques"></span>

## 1.A Pour Debian
- La commande SUDO installée
- Un serveur Debian connecté sur le même réseau que les machines client
- Le service SSH installé et actif sur toutes les machines client
- Clé d'accès SSH paramétrée entre le serveur et les machines client
## 1.B Pour Windows Serveur
- Un serveur Windows Serveur connecté sur le même réseau que les machines client
- Le service WinRM installé et actif sur toutes les machines client
- L'option Beta "Utiliser Unicode UTF-8" activée dans les paramètres de langue du système

# 2. Installation
<span id="installation"></span>

## 1.A Pour Debian
- Se connecter avec le compte utilisateur "**wilder**" et le mot de passe "**azerty1***"
- Cloner le dépôt GitHub avec la commande :
> git clone https://github.com/WildCodeSchool/TSSR-2503-P2-G1-TheScriptingProject.git
- Aller dans le dossier Shell_Bash avec la commande :
> cd TSSR-2503-P2-G1-TheScriptingProject/Shell_Bach
- Donner les droits d'exécution sur le script avec la commande :
> chmod u+x script_bash_v1.0.sh
- Lancer le script avec la commande :
> sudo ./script_bash_v1.0.sh

## 1.B Pour Windows Serveur
- Télécharger le dépôt GitHub au format .zip à cette adresse :
> https://github.com/WildCodeSchool/TSSR-2503-P2-G1-TheScriptingProject
- Décompresser le fichier téléchargé sur le bureau de votre machine
- Ouvrir le dossier "TSSR-2503-P2-G1-TheScriptingProject-main
- Ensuite ouvrir le fichier "PowerShell"
- Lancer le fichier "script_powershell_v0.4.ps1" avec PowerShell

# 3. FAQ
<span id="faq"></span>

- **Q** : Pourquoi lors de la 1ère utilisation du script Shell Bash, mon mot de passe est demandé pendant l’initialisation et plus après ?
- **R** : Lors du lancement du script Shell Bash, le script vérifie si le fichier de log "log_evt.log" existe. S'il n'existe pas, il le créé dans le dossier /var/log. Pour pouvoir créer ce fichier, le script a besoin de droit supplémentaire et utilise donc la commande Sudo.

----

- **Q** : Pourquoi il y a un dossier "Log" qui se créé dans le même répertoire où se trouve le script en Shell bash ?
- **R** : Pour chaque commande du script qui renvoie une information sur un utilisateur ou un ordinateur, un fichier est créé avec comme format de nom : "info_Cible_Date.txt". Ces fichiers sont stockés dans le dossier "Log".
