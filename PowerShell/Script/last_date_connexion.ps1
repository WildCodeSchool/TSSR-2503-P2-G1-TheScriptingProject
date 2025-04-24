clear

#Demander le nom de l'utilisateur
$user_name = Read-Host "De quel utilisateur souhaitez-vous voir la dernière connexion?"

#Afficher la demande
Get-LocalUser -Name $user_name | Select-Object Name, LastLogan
Read-Host "Appuyez sur [Entrée] pour continuer"