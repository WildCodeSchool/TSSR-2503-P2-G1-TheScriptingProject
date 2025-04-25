clear

#Liste des disques
Write-Host "Voici la liste des disques" -ForegroundColor DarkCyan
Get-PSDrive
#Compter les disques
Write-Host "`nVoici le nombre de disques" -ForegroundColor DarkCyan
(Get-PSDrive).count 
Read-Host "Appuyez sur [Entrée] pour continuer"