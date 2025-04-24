clear

#Demander le nom de l'utilisateur
$user_name= Read-Host "Quel est le nom de l'utilisateur?"

#Vérification si l'utilisateur existe déjà
if (Get-LocalUser -Name $user_name -ErrorAction SilentlyContinue)
{
    #L'utilisateur existe
    Write-Host "L'utilisateur existe déjà" -ForegroundColor Red
}
else
{
    #Création de l'utilisateur
    New-LocalUser -Name $user_name
    Write-Host "`nL'utilisateur a bien été créé" -ForegroundColor Green
}
