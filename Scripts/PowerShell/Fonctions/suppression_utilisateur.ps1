clear

#Demander le nom de l'utilisateur
$user_name= Read-Host "Quel est le nom de l'utilisateur?"

#Vérification si l'utilisateur existe
if (Get-LocalUser -Name $user_name -ErrorAction SilentlyContinue)
{
#Suppression de l'utilisateur
    Remove-LocalUser -Name $user_name
    Write-Host "`nL'utilisateur a bien été supprimé" -ForegroundColor Green
}
else
{
    #L'utilisateur n'existe pas
    Write-Host "L'utilisateur n'existe pas" -ForegroundColor Red
}