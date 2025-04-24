# Sommaire

1. [Prérequis technique](#prerequis-technique)
2. [Installation](#installation)
3. [FAQ](#faq)

# 1. Prérequis techniques
<span id="prerequis-techniques"></span>

## 1.A Pour Debian
- Un serveur Debian connecter sur le même réseau que les machines client
- Le service SSH installer et actif sur toutes les machines client
- Clé d'acces SSH paramétrer entre le Serveur et les machines client
## 1.B Pour Windows Serveur
- Un serveur Windows Serveur connecter sur le même réseau que les machines client
- Le service WinRM installer et actif sur toutes les machines client

# 2. Installation
<span id="installation"></span>

## 1.A Pour Debian
- Clonez le dépôt GitHub avec la commande :
> git clone https://github.com/WildCodeSchool/TSSR-2503-P2-G1-TheScriptingProject.git
- Allez dans le dossier Shell_Bash avec la commande :
> cd TSSR-2503-P2-G1-TheScriptingProject/Shell_Bach
- Donnez les droit d'execution sur le script avec la commande :
> chmod u+x script_principal.sh
- Lancez le script avec la commande :
> ./script_principal.sh

## 1.B Pour Windows Serveur
- Téléchargez le dépôt GitHub au format .zip à cette adresse :
> https://github.com/WildCodeSchool/TSSR-2503-P2-G1-TheScriptingProject
- Décompressez le fichier télécharger ou vous voulez sur votre machine
- Ouvrez le dossier "PowerShell"
- Lancer le fichier "script_powershell.ps1" avec PowerShell

# 3. FAQ
<span id="faq"></span>

- **Q** : Pourquoi lors de la 1er utilisation du script Shell Bash, mon mot de passe est demande pendent l’initialisation et plus jamais après ?
- **R** : Lors du lancement du script Shell Bash, le script vérifie si le fichier de log "log_evt.log" existe. Si il n'existe pas, il le créé dans le dossier /var/log. Pour pouvoir créé ce fichier, le script a besoin de droit supplémentaire et utilise donc la commande Sudo.

----

- **Q** : Pourquoi il y a un dossier "Log" qui ce créé dans le même répertoire où ce trouve le script ?
- **R** : Pour chaque commande du script qui renvoie une information sur un utilisateur ou un ordinateur, un fichier est créé avec comme format de nom : "info_Cible_Date.txt". Ces fichiers sont stocker dans le dossier "Log".
