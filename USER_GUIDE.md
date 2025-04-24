### Sommaire

1. [Serveur_Ubuntu](#ubuntu-serveur)  
    A. [Connexion au compte](#connexion-compte-ubu)  
    B. [Menu Utilisateur](#menu-utilisateur-ubu)  
    C. [Menu Ordinateur](#menu-ordinateur-ubu)  
    D. [Menu Script](#menu-script-ubu)  
2. [Serveur_Windows](#windows-serveur)  
    A. [Connexion au compte](#connexion-compte-win)  
    B. [Menu Utilisateur](#menu-utilisateur-win)  
    C. [Menu Ordinateur](#menu-ordinateur-win)  
    D. [Menu Script](#menu-script-win)  
3. [FAQ](#faq)  

# 1. Serveur Ubuntu  
<span id="ubuntu-serveur"></span>  

### A.Connexion au compte  
<span id="connexion-compte-ubu"></span>  

##### Etape 1:  
-------------------  
- Se connecter avec le compte utilisateur **wilder** et entrer le mot de passe _Azerty1*_  

![connexion](https://github.com/user-attachments/assets/844385e6-d8bf-4d49-886d-404fe56e506d)  

##### Etape 2:  
-------------------  
- Se déplacer dans le répertoire du script avec la commande:  
  > **cd Projet/TSSR-2503-P2-G1-TheScriptingProject/Scripts/Shell_Bash/**  

![deplacement_dans_le_repertoire](https://github.com/user-attachments/assets/2f35e43c-527d-4a36-93c8-120b9b4b779e)  


##### Etape 3:  
-------------------  
- Lancer le script avec la commande:  
  > **./script_principal.sh**  

![lancement_du_script](https://github.com/user-attachments/assets/7ccd38be-26f0-4474-89f3-4f36a6736ed0)  


##### Etape 4:  
-------------------  
- Vous arrivez sur le Menu de Bienvenue:  
  > Prendre le choix 1 **Client Ubuntu (CLILIN01)**  

![menu_de_bienvenue](https://github.com/user-attachments/assets/d039a669-cc77-4e53-b212-0b89136546eb)  


##### Etape 5:  
-------------------  
- Vous arrivez sur le Menu de l'utilisateur:  
  > Prendre le choix 1 **Wilder**  

![choix_utilisateur](https://github.com/user-attachments/assets/28652ef2-5148-44a9-a03e-309a7849d394)  


##### Etape 6:  
-------------------  
- Vous arrivez sur le Menu Principal:  
  > Ici vous pouvez choisir entre 3 grands menus que nous allons détailler par la suite :  
    Le **Menu Utilisateur** (pour avoir des **informations** ou effectuer des **actions** sur un _**utilisateur**_)  
    Le **Menu Ordinateur** (pour avoir des **informations** ou effectuer des **actions** sur un _**ordinateur**_)  
    Le **Menu Script** (pour **rechercher des évènements** sur un _**utilisateur**_ ou un _**ordinateur**_ dans le fichier de log)  

![menu_principal](https://github.com/user-attachments/assets/0bd84707-3fc9-49d2-b4e1-610863a38283)  


### B.Menu Utilisateur  
<span id="menu-utilisateur-ubu"></span>  

##### Etape 1:  
-------------------  
- Vous pouvez choisir **une action** , **une information** ou **revenir au menu précédent**    

![menu_utilisateur](https://github.com/user-attachments/assets/839f85dc-60e6-4bd9-b10e-72ecfbc835d1)  

##### Etape 2:  
-------------------  
- En choisissant **une action**, vous avez plusieurs choix possibles  
  Vous pouvez :  
  - Créer un nouveau compte utilisateur local  
  - Changer le mot de passe d'un utilisateur  
  - Supprimer un compte utilisateur  
  - Désactiver un compte utilisateur  
  - Ajouter un utilisateur à un groupe administrateur  
  - Ajouter un utilisateur à un groupe local  
  - Retirer un utilisateur à un groupe local  
  - Revenir au menu précédent  
![menu_des_actions_utilisateur](https://github.com/user-attachments/assets/de278dcc-0fe8-42fb-847a-1041e214312f)


- En choisissant **une information**, vous avez plusieurs choix possibles  
  Vous pouvez :  
  - Connaître la date de dernière connexion de l' utilisateur    
  - Connaître la date de dernière modification de mot de passe de l' utilisateur     
  - Voir la liste des sessions ouvertes par l'utilisateur    
  - Voir le groupe auquel un utilisateur appartient    
  - Voir l'historique des commandes utilisées par l'utilisateur  
  - Voir quels sont les droits et permissions de l'utilisateur pour un dossier en particulier    
  - Voir quels sont les droits et permissions de l'utilisateur pour un fichier en particulier    
  - Revenir au menu précédent  
  
![menu_des_informations_utilisateur](https://github.com/user-attachments/assets/1defc4d8-77a0-4f72-a50e-3d639582bf19)  



### C.Menu Ordinateur  
<span id="menu-ordinateur-ubu"></span>  

##### Etape 1:  
-------------------  
- Vous pouvez choisir **une action** , **une information** ou **revenir au menu précédent**    
  
![menu_ordinateur](https://github.com/user-attachments/assets/58279051-9b69-4544-97c5-abde7c664709)  

##### Etape 2:  
-------------------  
- En choisissant **une action**, vous avez plusieurs choix possibles  
  Vous pouvez :  
  - Arrêter l'ordinateur de l'utilisateur  
  - Redémarrer l'ordinateur de l'utilisateur  
  - Verrouiller l'ordinateur de l'utilisateur  
  - Faire une mise à jour du système  
  - Créer un répertoire  
  - Modifier un répertoire  
  - Supprimer un répertoire  
  - Prendre la main à distance de l'ordinateur de l'utilisateur (en ligne de commande)
  -  Activer le pare-feu
  -  Désactiver le pare-feu
  -  Installer un logiciel
  -  Désinstaller un logiciel
  -  Exécuter un script sur l'ordinateur de l'utilisateur
  -  Revenir au menu précédent
      
![menu_des_actions_ordinateur](https://github.com/user-attachments/assets/4f1dad3b-29dc-4a1e-a808-e4139c8e35c4)  


##### Etape 3:  
-------------------  
- En choisissant **une information**, vous avez plusieurs choix possibles  
  Vous pouvez :  
  - Voir la version de l'OS  
  - Voir le nombre de disque  
  - Voir les détails des partitions par disque  
  - Voir l'espace disque restant par partition/volume  
  - Voir le nom et l'espace disque d'un dossier  
  - Voir la liste des lecteurs montés  
  - Voir la liste des applications et des paquets installées  
  - Voir la liste des services en cours d'exécution  
  - Voir la liste des utiilisateurs locaux  
  - Voir la mémoire RAM totale  
  - Voir l'utilisation de la RAM  
  - Revenir au menu précédent  
  
  
![menu_des_informations_ordinateur](https://github.com/user-attachments/assets/54ac0780-72be-4374-a285-1bce7e4eef25)  



### D.Menu Script  
<span id="menu-script-ubu"></span>  

##### Etape 1:  
-------------------  
- Vous pouvez choisir de **rechercher un évènement** dans le fichier _log_ pour un **utilisateur** ou un **ordinateur** ou **revenir au menu précédent**    
  
![menu_script](https://github.com/user-attachments/assets/302605b6-add8-4577-9637-310d4453a875)  
  
  
# 2. Serveur Windows  
<span id="windows-serveur"></span>  

### A.Connexion au compte  
<span id="connexion-compte-win"></span>  

##### Etape 1:  
-------------------  
- Choisissez sur quelle machine vous désirez vous connecter  

![choix_cible](https://github.com/user-attachments/assets/ee65deed-ca76-4cf5-82f3-6f051e3cd4a0)
 

##### Etape 2:  
-------------------  
- Entrez votre **nom d'utilisateur** _Wilder_ et votre mot de passe _Azerty1*_  
   
![connexion](https://github.com/user-attachments/assets/da9227ae-dd90-4cca-8abe-4bb607e70263)
  

##### Etape 3:  
-------------------  
- Un message de bienvenue s'affiche, appuyer sur la touche [Entrée] pour valider:  
  
![message_de_bienvenue](https://github.com/user-attachments/assets/82be50c2-b839-4977-8ead-f04257abb81a)  
 
  
##### Etape 4:  
-------------------  
  
- Vous arrivez sur le Menu Principal:  
  > Ici vous pouvez choisir entre 3 grands menus que nous allons détailler par la suite :  
    Le **Menu Utilisateur** (pour avoir des **informations** ou effectuer des **actions** sur un _**utilisateur**_)  
    Le **Menu Ordinateur** (pour avoir des **informations** ou effectuer des **actions** sur un _**ordinateur**_)  
    Le **Menu Script** (pour **rechercher des évènements** sur un _**utilisateur**_ ou un _**ordinateur**_ dans le fichier de log)  

![menu_principal](https://github.com/user-attachments/assets/55d5a599-0e08-4d1f-becc-995b35ccf19b)  
  

### B.Menu Utilisateur  
<span id="menu-utilisateur-win"></span>  

##### Etape 1:  
-------------------  
- Vous pouvez choisir **une action** , **une information** ou **revenir au menu précédent**    

![menu_utilisateur](https://github.com/user-attachments/assets/23ad3fe3-2f98-429a-af53-35b24df42909)
  

  

##### Etape 2:  
-------------------  
- En choisissant **une action**, vous avez plusieurs choix possibles  
  Vous pouvez :  
  - Créer un nouveau compte utilisateur local  
  - Changer le mot de passe d'un utilisateur local  
  - Supprimer un compte utilisateur local  
  - Désactiver un compte utilisateur local  
  - Ajouter un utilisateur à un groupe administrateur  
  - Ajouter un utilisateur à un groupe local  
  - Retirer un utilisateur à un groupe local  
  - Revenir au menu précédent  
![menu_des_actions_utilisateur](https://github.com/user-attachments/assets/7ff6f506-115a-4f9b-b0bd-3ca0b5091f9b)  
  
  
- En choisissant **une information**, vous avez plusieurs choix possibles  
  Vous pouvez :  
  - Connaître la date de dernière connexion de l' utilisateur    
  - Connaître la date de dernière modification de mot de passe de l' utilisateur     
  - Voir la liste des sessions ouvertes par l'utilisateur    
  - Voir le groupe auquel un utilisateur appartient    
  - Voir l'historique des commandes utilisées par l'utilisateur  
  - Voir quels sont les droits et permissions de l'utilisateur pour un dossier en particulier    
  - Voir quels sont les droits et permissions de l'utilisateur pour un fichier en particulier    
  - Revenir au menu précédent  
  
![menu_des_informations_utilisateur](https://github.com/user-attachments/assets/90293e88-dfb8-4571-8a4d-8d7f5450b976)
  
  
### C.Menu Ordinateur  
<span id="menu_ordinateur-win"></span>  

##### Etape 1:  
-------------------  
- Vous pouvez choisir **une action** , **une information** ou **revenir au menu précédent**    
  
![menu_ordinateur](https://github.com/user-attachments/assets/a4446632-5115-43a0-9619-c6ee397efa8c)
  

##### Etape 2:  
-------------------  
- En choisissant **une action**, vous avez plusieurs choix possibles  
  Vous pouvez :  
  - Arrêter l'ordinateur de l'utilisateur  
  - Redémarrer l'ordinateur de l'utilisateur  
  - Verrouiller l'ordinateur de l'utilisateur  
  - Faire une mise à jour du système  
  - Créer un répertoire  
  - Modifier un répertoire  
  - Supprimer un répertoire  
  - Prendre la main à distance de l'ordinateur de l'utilisateur (en ligne de commande)
  -  Activer le pare-feu
  -  Désactiver le pare-feu
  -  Installer un logiciel
  -  Désinstaller un logiciel
  -  Exécuter un script sur l'ordinateur de l'utilisateur
  -  Revenir au menu précédent
      
![menu_des_actions_ordinateur](https://github.com/user-attachments/assets/1a3b63f5-c255-4667-9068-2c147d33bb42)  


##### Etape 3: 
-------------------  
- En choisissant **une information**, vous avez plusieurs choix possibles  
  Vous pouvez :  
  - Voir la version de l'OS  
  - Voir le nombre de disque  
  - Voir les détails des partitions par disque  
  - Voir l'espace disque restant par partition/volume  
  - Voir le nom et l'espace disque d'un dossier  
  - Voir la liste des lecteurs montés  
  - Voir la liste des applications et des paquets installées  
  - Voir la liste des services en cours d'exécution  
  - Voir la liste des utiilisateurs locaux  
  - Voir la mémoire RAM totale  
  - Voir l'utilisation de la RAM  
  - Revenir au menu précédent  

![menu_des_informations_ordinateurs](https://github.com/user-attachments/assets/565ae4cb-e0cd-4c9a-9cd9-cf4395c1b1fe)  

  


### D.Menu Script  
<span id="menu_script-win"></span>  

##### Etape 1:  
-------------------  
- Vous pouvez choisir de **rechercher un évènement** dans le fichier _log_ pour un **utilisateur** ou un **ordinateur** ou **revenir au menu précédent**    
  
![menu_script](https://github.com/user-attachments/assets/7bcd3768-5516-469b-a1d5-76d62d9539df)
  
  
  


# 3. FAQ
<span id="faq"></span>
