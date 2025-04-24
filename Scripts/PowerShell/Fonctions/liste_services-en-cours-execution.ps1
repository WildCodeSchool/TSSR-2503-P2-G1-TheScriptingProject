clear

#Liste des services en cours d'execution
Write-Host "Voici la liste des services en cours d'execution"`n 
#Affichage de la liste
Get-Service | Where-Object {$_.status -eq "Running"}