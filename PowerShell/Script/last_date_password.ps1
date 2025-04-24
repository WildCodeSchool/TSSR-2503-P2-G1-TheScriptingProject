clear

$user_name = "Nom de l'utilisateur"
#Demande nom utilisateur
$user_name = Read-Host "Quel est le nom de l'utilisateur?"
#Affichage date dernière modification de mot de passe
Write-Host "Affichage de la dernière modification du mot de passe"
Get-LocalUser -Name $user_name | Select-Object Name, PasswordLastSet
Read-Host "Appuyez sur [Entrée] pour continuer"