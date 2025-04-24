clear

#Affichage de la version de l'OS
Write-Host "Affichage de la version de l'OS en cours"
Get-ComputerInfo | Select-Object OsName, OsVersion
Read-Host "Appuyez sur [Entrée] pour continuer"