#----------------------------------------------------------------------------------------------------------------------
#				Declaration de variable
#----------------------------------------------------------------------------------------------------------------------







#----------------------------------------------------------------------------------------------------------------------
#				Fonctions d'initialisation
#----------------------------------------------------------------------------------------------------------------------

function initialisation1 
{
    Clear-Host
    Write-Host "===== Bienvenue ====="  
    Write-Host ""
    Write-Host "1. Client Windows (CLIWIN01)"
    Write-Host "2. Client Ubuntu (CLILIN01) [WIP]"
    Write-Host "3. Autre"
    Write-Host "4. Quitter"
    Write-Host ""
    $Ini1 = Read-Host "Merci de choisir la machine cible "
    Switch ($Ini1) {
        1 {$TargetComputeur="CLIWIN01"
            initialisation2}
        2 {Read-Host "Choix invalide, appuyez sur [Entrée] pour continuer"
        initialisation1}
        3 {Read-Host -Prompt "Merci de rentrer l'adresse IP de la machine cible " -OutVariable TargetComputeur
            initialisation2}
        4 {exit}
        default {
            Read-Host "Choix invalide, appuyez sur [Entrée] pour continuer"
            initialisation1
        }
    }
}



function initialisation2 
{    
    Clear-Host
    Write-Host "===== Bienvenue ====="  
    Write-Host ""
    Write-Host "Merci d'Indiquer les information de connexion de l'utilisateur cible : "
    $Cred=$(Get-Credential)
    Read-Host -Prompt "Merci d'indiquer le chemin complet ou ce trouve le dossier 'Script' " -OutVariable ScriptPath
    Clear-Host
    Write-Host "Initialisation des Credential..."
    Start-Sleep -Seconds 1
    Write-Host "Initialistion des logs [WIP] ..."
    Start-Sleep -Seconds 1
    Write-Host "Initialisation du dossier Script ..."
    Start-Sleep -Seconds 1
    Write-Host "Done"
    Start-Sleep -Seconds 1
    main_menu    
}


#----------------------------------------------------------------------------------------------------------------------
#				Fonctions de boucle
#----------------------------------------------------------------------------------------------------------------------

function boucle {
    Clear-Host
    Write-Host "===== Tâche terminée ====="
    Write-Host ""
    $choix = Read-Host "Vous voulez continuer ? [Oui/Non]"
    Switch ($choix) {
        Oui {main_menu}
        Non {Clear-Host
            Write-Host "Arrêt du script ..."
            Start-Sleep -Seconds 1
            Write-Host "Enregistrement des logs ..."
            Start-Sleep -Seconds 1
            Write-Host "Vérification ..."
            Start-Sleep -Seconds 1
            Write-Host "Nettoyage ..."
            Write-Host ""
            Write-Host "===== Script by : Tatiana, John et Lloyd ====="
            exit}
        default {
            Read-Host "Choix invalide, appuyez sur [Entrée] pour continuer"
            boucle}
    }
}

#----------------------------------------------------------------------------------------------------------------------
#				Fonctions utilisées ACTIONS UTILISATEUR
#----------------------------------------------------------------------------------------------------------------------


#Fonction de création de compte utilisateur local
function creating_a_local_user_account 
{
    Clear-Host
    #Demander le nom de l'utilisateur
    $user_name= Read-Host "Quel est le nom de l'utilisateur?"

    #Vérification si l'utilisateur existe déjà
    if (Get-LocalUser -Name $user_name -ErrorAction SilentlyContinue)
    {
        #L'utilisateur existe
        Write-Host "L'utilisateur existe déjà" -ForegroundColor Red
        Read-Host "Appuyez sur [Entrée] pour continuer"
        boucle
    }
    else
    {
        #Création de l'utilisateur
        New-LocalUser -Name $user_name
        Write-Host "`nL'utilisateur a bien été créé" -ForegroundColor Green
        Read-Host "Appuyez sur [Entrée] pour continuer"
        boucle
    }
}


#Fonction Changement de mot de passe
function change_password 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    action_user_menu_choice
}


#Fonction de la suppression de compte utilisateur local
function deleting_a_local_user_account 
{
    Clear-Host
    #Demander le nom de l'utilisateur
    $user_name= Read-Host "Quel est le nom de l'utilisateur?"

    #Vérification si l'utilisateur existe
    if (Get-LocalUser -Name $user_name -ErrorAction SilentlyContinue)
    {
        #Suppression de l'utilisateur
        Remove-LocalUser -Name $user_name
        Write-Host "`nL'utilisateur a bien été supprimé" -ForegroundColor Green
        Read-Host "Appuyez sur [Entrée] pour continuer"
        boucle
    }
    else
    {
        #L'utilisateur n'existe pas
        Write-Host "L'utilisateur n'existe pas" -ForegroundColor Red
        Read-Host "Appuyez sur [Entrée] pour continuer"
        boucle
    }
}


#Fonction de la désactivation de compte utilisateur local
function local_user_account_deactivation 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    action_user_menu_choice
}


#Fonction d'ajout à un groupe d'administration
function adding_to_an_administration_group 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    action_user_menu_choice
}


#Fonction d'ajout à un groupe local
function adding_to_a_local_group 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    action_user_menu_choice
}


#Fonction de sortie d’un groupe local
function local_band_release 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    action_user_menu_choice
}


#----------------------------------------------------------------------------------------------------------------------
#				 Fonctions utilisées INFORMATIONS UTILISATEUR
#----------------------------------------------------------------------------------------------------------------------


#Fonction de dernière connexion
function last_date_connexion 
{
    Clear-Host
    #Demander le nom de l'utilisateur
    $user_name = Read-Host "De quel utilisateur souhaitez-vous voir la dernière connexion?"

    #Afficher la demande
    Get-LocalUser -Name $user_name | Select-Object Name, LastLogan
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction de dernière modification de mot de passe
function last_date_password 
{
    Clear-Host
    $user_name = "Nom de l'utilisateur"
    #Demande nom utilisateur
    $user_name = Read-Host "Quel est le nom de l'utilisateur?"
    #Affichage date dernière modification de mot de passe
    Write-Host "Affichage de la dernière modification du mot de passe"
    Get-LocalUser -Name $user_name | Select-Object Name, PasswordLastSet
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction de la liste des session ouvertes par un utilisateur
function open_user_session 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    info_user_menu_choice
}


#Fonction du groupe auquel appartient un utilisateur
function user_groups 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    info_user_menu_choice
}


#Fonction de l'historique des commandes exécutées par un utilisateur
function all_command_user 
{
    Clear-Host
    #Historique
    Write-Host "Voici l'historique des commandes utilisées"`n

    #Affichage de l'historique
    Get-History
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction de visualisation des droits/permissions pour un utilisateur sur un dossier
function access_folder 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    info_user_menu_choice
}


#Fonction de visualisation des droits/permissions pour un utilisateur sur un fichier
function access_file 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    info_user_menu_choice 
}



#------------------------------------------------------------------------------------------------------------------
#				 Fonctions utilisées ACTIONS ORDINATEUR
#------------------------------------------------------------------------------------------------------------------


#Fonction Arrêt ordinateur
function computer_shutdown 
{
    Clear-Host
    Write-Host "Arret de $TargetComputeur en cours ..."
    Stop-Computer -ComputerName $TargetComputeur -Credential $Cred -Force
    Write-Host "Arret effectuer"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction de redémarrage de l'ordinateur
function restart_computer 
{
    Clear-Host
    Write-Host "Redémarrage de $TargetComputeur en cours ..."
    Restart-Computer -ComputerName $TargetComputeur -Credential $Cred -Force
    Write-Host "Redémarrage effectuer"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction de verrouillage de l'ordinateur
function computer_lock 
{
    Clear-Host
    Write-Host "Verrouillage de $TargetComputeur en cours ..."
    #Option Lock dans le fichier user32.dll avec la commande rundll32.exe
    rundll32.exe user32.dll,LockWorkStation
    Write-Host "Verrouillage effectuer"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction de mise-à-jour du système
function system_update 
{
    Clear-Host
    #On enregistre la "Politique d'execution du PC" dans la variable ExePolicie 
    $ExePolicie=Get-ExecutionPolicy
    #On verifie ExePolicie : si elle est pas "Bypass" ont la modifie sinon on continue
    if ($ExePolicie -ne "Bypass") 
    {
        Set-ExecutionPolicy Bypass -Force
    }
    #Import et install le module PSWindowsUpdate
    Install-Module PSWindowsUpdate
    #On recupere le nombre de MaJ dispo
    $UpDate=Get-WindowsUpdate
    #Si il n'y pas de MaJ dispo ont arrete le script
    if ($UpDate.Count -eq 0)
    {
        Write-Host "Pas de Mise à Jour disponible"
        Read-Host "Appuiez sur ENTER pour quitter ..."
        Exit 1
    }
    Write-Host "$($UpDate.Count) Mise à Jour trouvée. Installation des Mise à Jour ..."
    Install-WindowsUpdate -AcceptAll
    Write-Host "Mise à jour : Terminer."
    #On remet la "Politique d'execution" comme on la trouver au debut
    Set-ExecutionPolicy $ExePolicie -Force
    Read-Host "Appuiez sur ENTER pour continuer ..."
    boucle
}


#Fonction de création de répertoire
function directory_creation 
{
    Clear-Host
    #Demander le nom du dossier à créer
    $nomDossier = Read-Host "Entrez le nom du dossier"
    #Demander le chemin complet où créer le dossier
    $chemin = Read-Host "Entrez le chemin complet"
    #Créer le dossier
    Write-Host "Création du dossier en cours"
    New-Item -ItemType Directory -Name $nomDossier -Path $chemin
    #Validation de la création
    Write-Host "`nRépertoire créé" -ForegroundColor Green
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction de modification de répertoire
function directory_modification 
{
    Clear-Host
    #Demander le nom du dossier à modifier
    $nomDossier = Read-Host "Entrez le nom du dossier"
    #Demander le chemin jusqu'au dossier
    $chemin = Read-Host "Entrez le chemin complet"
    #Renommer le dossier
    Rename-Item $nomDossier
    #Validation du nouveau nom de dossier
    Write-Host "`nLe dossier a bien été renommé" -ForegroundColor Yellow
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction de suppression de répertoire
function directory_deletion 
{
    Clear-Host
    #Demander le nom du dossier à supprimer
    $nomDossier = Read-Host "Entrez le nom du dossier"
    $chemin = Read-Host "Entrez le chemin complet"
    Remove-Item $nomDossier
    Write-Host "`nLe dossier et son contenu ont été supprimer" -ForegroundColor Green
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction de prise de main à distance (CLI)
function remote_control 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    action_computer_menu_choice 
}


#Fonction d'activation du pare-feu
function enable_firewall 
{
    Clear-Host
    #Vérifier le statut du pare-feu
    $firewall_status = Get-NetFirewallProfile | Select-Object -ExpandProperty Enabled

    #Statut du pare-feu
    if ($firewall_status -eq $True) 
    {
        #Demande d'activation
        Write-Host "Le pare-feu est désactivé, voulez-vous l'activer?(oui/non)"
        $choix = Read-Host "reponse"
        #Lecture du choix
        switch ($choix) {
            oui { 
                Write-Host "Activation du pare-feu" -ForegroundColor Green
                Set-NetFirewallProfile -Enabled True
                Read-Host "Appuyez sur [Entrée] pour continuer"
                boucle
                }
            non {
                Write-Host "Aucun pare-feu d'activé" -ForegroundColor Yellow
                Read-Host "Appuyez sur [Entrée] pour continuer"
                boucle
                }
            default { 
                Write-Host "Erreur: Répondre par oui ou non" -ForegroundColor Red
                enable_firewall 
                }
        }
    }
    else
    {
        #Demande d'activation
        Write-Host "Le pare-feu est déjà activé"
        Read-Host "Appuyez sur [Entrée] pour continuer"
        boucle
    }
}


#Fonction de désactivation du pare-feu
function disable_firewall 
{
    Clear-Host
    #Vérifier le statut du pare-feu
    $firewall_status = Get-NetFirewallProfile | Select-Object -ExpandProperty Enabled

    #Statut du pare-feu
    if ($firewall_status -eq $False) {
    #Demande de désactivation
    Write-Host "Le pare-feu est activé, voulez-vous le désactiver?(oui/non)"
    $choix = Read-Host "reponse"

        #Lecture du choix
        switch ($choix) 
            {
            oui { 
            Write-Host "Désactivation du pare-feu" -ForegroundColor Green
            Set-NetFirewallProfile -Enabled False
            Read-Host "Appuyez sur [Entrée] pour continuer"
            boucle
                }   
            non {
            Write-Host "Aucun pare-feu de désactivé" -ForegroundColor Yellow
            Read-Host "Appuyez sur [Entrée] pour continuer"
            boucle
                }
            default {
                Write-Host "Erreur: Répondre par oui ou non" -ForegroundColor Red
                disable_firewall
                    }
            }
    }
    else 
    {
        #Désactivation déjà en place
        Write-Host "Le pare-feu est déjà désactivé"
        Read-Host "Appuyez sur [Entrée] pour continuer"
        boucle
    }
}


#Fonction d'installation de logiciel
function software_installation 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    action_computer_menu_choice 
}


#Fonction de désinstallation de logiciel
function software_uninstallation 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    action_computer_menu_choice 
}


#Fonction d'exécution de script sur la machine distante
function script_execution_on_remote_machine 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    action_computer_menu_choice 
}


#-----------------------------------------------------------------------------------------------------------------
#				 Fonctions utilisées INFORMATIONS ORDINATEUR
#-----------------------------------------------------------------------------------------------------------------


#Fonction version de l'OS
function os_version 
{
    #Affichage de la version de l'OS
    Write-Host "Affichage de la version de l'OS en cours"
    Get-ComputerInfo | Select-Object OsName, OsVersion
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction nombre de disque
function disk_number 
{
    Clear-Host
    #Liste des disques
    Write-Host "Voici la liste des disques" -ForegroundColor DarkCyan
    Get-PSDrive
    #Compter les disques
    Write-Host "`nVoici le nombre de disques" -ForegroundColor DarkCyan
    (Get-PSDrive).count 
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction info partition
function partition_info 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    info_computer_menu_choice
}


#Fonction espace disque restant
function free_space 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    info_computer_menu_choice
}


#Fonction nom et espace disque d'un dossier
function info_folder 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    info_computer_menu_choice
}


#Fonction liste des lecteurs montés
function mounted_drive_list 
{
    Clear-Host
    #Liste des lecteurs montés (disque, CD, etc.)
    Write-Host "Voici la liste des lecteurs montés"
    Get-Volume
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction liste des applications/paquets installées
function pack_app_installed 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    info_computer_menu_choice
}


#Fonction liste des services en cours d'exécution
function serv_progress 
{
    Clear-Host
    #Liste des services en cours d'execution
    Write-Host "Voici la liste des services en cours d'execution"`n 
    #Affichage de la liste
    Get-Service | Where-Object {$_.status -eq "Running"}
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}

#Fonction liste des utilisateurs locaux
function local_users_list 
{
    Clear-Host
    #Liste des utilisateurs locaux
    Write-Host "Voici la liste utilisateurs"
    Get-LocalUser
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#Fonction mémoire RAM totale
function total_ram 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    info_computer_menu_choice
}


#Fonction utilisation de la RAM
function ram_used 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    info_computer_menu_choice
}


#-----------------------------------------------------------------------------------------------------------------
#                                Fonctions utilisées SCRIPT
#-----------------------------------------------------------------------------------------------------------------

function user_event 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


function computer_event 
{
    Clear-Host
    Write-Host "En construction ... [WIP]"
    Read-Host "Appuyez sur [Entrée] pour continuer"
    boucle
}


#-----------------------------------------------------------------------------------------------------------------------------------------
#                                                 Fonctions sous sous-menu
#-----------------------------------------------------------------------------------------------------------------------------------------

#Fonction du sous Menu des actions utilisateur

function action_user_menu_choice 
{
    Clear-Host
    Write-Host "===== Menu des actions utilisateur ====="
    Write-Host ""
    Write-Host "1. Création de compte utilisateur local"
    Write-Host "2. Changement de mot de passe [WIP]"
    Write-Host "3. Suppression de compte utilisateur local"
    Write-Host "4. Désactivation de compte utilisateur local [WIP]"
    Write-Host "5. Ajout à un groupe d'administration [WIP]"
    Write-Host "6. Ajout à un groupe local [WIP]"
    Write-Host "7. Sortie d’un groupe local [WIP]"
    Write-Host "8. Retour au menu précédent"
    Write-Host ""

    $choice = Read-Host "Que voulez-vous faire ?"

    switch ($choice) {
        1 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\creating_a_local_user_account.ps1 
            boucle}
        2 { change_password }
        3 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\deleting_a_local_user_account.ps1 
            boucle}
        4 { local_user_account_deactivation }
        5 { adding_to_an_administration_group }
        6 { adding_to_a_local_group }
        7 { local_band_release }
        8 { user_menu }
        default {
            Read-Host "Choix invalide, appuyez sur [Entrée] pour continuer"
            action_user_menu_choice
        }
    }
}


#Fonction du sous Menu des informations utilisateur

function info_user_menu_choice 
{
    Clear-Host
    Write-Host "===== Menu des informations utilisateur ====="
    Write-Host ""
    Write-Host "1. Date de dernière connexion"
    Write-Host "2. Date de dernière modification de mot de passe"
    Write-Host "3. Liste des sessions ouvertes par l'utilisateur [WIP]"
    Write-Host "4. Groupe d’appartenance d’un utilisateur [WIP]"
    Write-Host "5. Historique des commandes exécutées par l'utilisateur"
    Write-Host "6. Droits/permissions de l’utilisateur sur un dossier [WIP]"
    Write-Host "7. Droits/permissions de l’utilisateur sur un fichier [WIP]"
    Write-Host "8. Retour au menu précédent"
    Write-Host ""

    $choice = Read-Host "Choisissez une information"

    switch ($choice) {
        1 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\last_date_connexion.ps1
            boucle }
        2 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\last_date_password.ps1
            boucle }
        3 { open_user_session }
        4 { user_groups }
        5 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\all_command_user.ps1
            boucle }
        6 { access_folder }
        7 { access_file }
        8 { user_menu }
        default {
            Read-Host "Choix invalide, appuyez sur [Entrée] pour continuer"
            info_user_menu_choice
        }
    }
}


#Fonction du sous Menu des actions Ordinateur

function action_computer_menu_choice 
{
    Clear-Host
    Write-Host "===== Menu des actions ordinateur ====="
    Write-Host ""
    Write-Host "1. Arrêt ordinateur"
    Write-Host "2. Redémarrage ordinateur"
    Write-Host "3. Verrouillage ordinateur"
    Write-Host "4. Mise à jour du système"
    Write-Host "5. Création de répertoire"
    Write-Host "6. Modification de répertoire"
    Write-Host "7. Suppression de répertoire"
    Write-Host "8. Prise de main à distance (CLI) [WIP]"
    Write-Host "9. Activation du pare-feu"
    Write-Host "10. Désactivation du pare-feu"
    Write-Host "11. Installation de logiciel [WIP]"
    Write-Host "12. Désinstallation de logiciel [WIP]"
    Write-Host "13. Exécution de script sur la machine distante [WIP]"
    Write-Host "14. Retour au menu précédent"
    Write-Host ""

    $choice = Read-Host "Que voulez-vous faire ?"

    switch ($choice) {
        1 { computer_shutdown }
        2 { restart_computer }
        3 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\computer_lock.ps1
            boucle }
        4 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\system_update.ps1
            boucle }
        5 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\directory_creation.ps1
            boucle }
        6 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\directory_modification.ps1
            boucle }
        7 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\directory_deletion.ps1
            boucle }
        8 { remote_control }
        9 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\enable_firewall.ps1
            boucle }
        10 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\disable_firewall.ps1
            boucle }
        11 { software_installation }
        12 { software_uninstallation }
        13 { script_execution_on_remote_machine }
        14 { computer_menu }
        default {
            Read-Host "Choix invalide, appuyez sur [Entrée] pour continuer"
            action_computer_menu_choice
        }
    }
}


#Fonction du sous Menu des informations Ordinateur

function info_computer_menu_choice 
{
    Clear-Host
    Write-Host "===== Menu des informations ordinateur ====="
    Write-Host ""
    Write-Host "1. Version de l'OS"
    Write-Host "2. Nombre de disques"
    Write-Host "3. Partitions (nombre, nom, FS, taille) par disque [WIP]"
    Write-Host "4. Espace disque restant par partition/volume [WIP]"
    Write-Host "5. Nom et espace disque d'un dossier (nom de dossier demandé) [WIP]"
    Write-Host "6. Liste des lecteurs montés (disque, CD, etc.)"
    Write-Host "7. Liste des applications/paquets installés [WIP]"
    Write-Host "8. Liste des services en cours d'exécution"
    Write-Host "9. Liste des utilisateurs locaux"
    Write-Host "10. Mémoire RAM totale [WIP]"
    Write-Host "11. Utilisation de la RAM [WIP]"
    Write-Host "12. Retour au menu précédent"
    Write-Host ""

    $choice = Read-Host "Que voulez-vous faire ?"

    switch ($choice) {
        1 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\os_version.ps1 
            boucle}
        2 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\disk_number.ps1 
            boucle}
        3 { partition_info }
        4 { free_space }
        5 { info_folder }
        6 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\mounted_drive_list.ps1
            boucle }
        7 { pack_app_installed }
        8 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\serv_progress.ps1
            boucle }
        9 {Invoke-Command -ComputerName $TargetComputeur -Credential $Cred -FilePath $ScriptPath\local_users_list.ps1
            boucle }
        10 { total_ram }
        11 { ram_used }
        12 { computer_Menu }
        default {
            Read-Host "Choix invalide, appuyez sur [Entrée] pour continuer"
            info_computer_menu_choice
        }
    }
}


#-------------------------------------------------------------------------------------------------------------------------------
#                                                     Fonction des sous menu
#-------------------------------------------------------------------------------------------------------------------------------

#Fonction du Menu Utilisateur

function user_menu 
{
    Clear-Host
    Write-Host "===== Menu Utilisateur ====="
    Write-Host ""
    Write-Host "1. Une Action"
    Write-Host "2. Une Information"
    Write-Host "3. Retour au menu précédent"
    Write-Host ""

    $user_menu_choice = Read-Host "Que voulez-vous faire ?"

    switch ($user_menu_choice) {
        1 { action_user_menu_choice }
        2 { info_user_menu_choice }
        3 { main_menu }
        default {
            Read-Host "Choix invalide, appuyez sur [Entrée] pour continuer"
            user_menu
        }
    }
}

#Fonction du Menu Ordinateur

function Computer_Menu 
{
    Clear-Host
    Write-Host "===== Menu Ordinateur ====="
    Write-Host ""
    Write-Host "1. Une Action"
    Write-Host "2. Une Information"
    Write-Host "3. Retour au menu précédent"
    Write-Host ""

    $computer_menu_choice = Read-Host "Que voulez-vous faire ?"

    switch ($computer_menu_choice) {
        1 { action_computer_menu_choice }
        2 { info_computer_menu_choice }
        3 { main_menu }
        default {
            Read-Host "Choix invalide, appuyez sur [Entrée] pour continuer"
            computer_menu
        }
    }
}

#Fonction du Menu Script

function script_menu 
{
    Clear-Host
    Write-Host "===== Menu Script ====="
    Write-Host ""
    Write-Host "1. Recherche des évènements pour un utilisateur"
    Write-Host "2. Recherche des évènements pour un ordinateur"
    Write-Host "3. Retour au menu précédent"
    Write-Host ""

    $script_menu_choice = Read-Host "Que voulez-vous faire ?"

    switch ($script_menu_choice) {
        1 { user_event }
        2 { computer_event }
        3 { main_menu }
        default {
            Read-Host "Choix invalide, appuyez sur [Entrée] pour continuer"
            script_menu
        }
    }
}


#-----------------------------------------------------------------------------------------------------------------------------------------
#								Menu Principal
#-----------------------------------------------------------------------------------------------------------------------------------------

function main_menu 
{
    Clear-Host
    Write-Host "===== Menu Principal ====="
    Write-Host ""
    Write-Host "1. Menu Utilisateur"
    Write-Host "2. Menu Ordinateur"
    Write-Host "3. Menu Script"
    Write-Host "4. Retour"
    Write-Host "5. Quitter"
    Write-Host ""

    $main_choice = Read-Host "Choisissez votre cible"

    switch ($main_choice) {
        1 { user_menu }
        2 { computer_menu }
        3 { script_menu }
        4 { initialisation2 }
        5 {
            Clear-Host
            Write-Host "Arrêt du script ..."
            Start-Sleep -Seconds 1
            Write-Host "Enregistrement des logs ..."
            Start-Sleep -Seconds 1
            Write-Host "Vérification ..."
            Start-Sleep -Seconds 1
            Write-Host "Nettoyage ..."
            Write-Host ""
            Write-Host "===== Script by : Tatiana, John et Lloyd ====="
            exit
        }
        default {
            Read-Host "Choix invalide, appuyez sur [Entrée] pour continuer"
            main_menu
        }
    }
}

initialisation1