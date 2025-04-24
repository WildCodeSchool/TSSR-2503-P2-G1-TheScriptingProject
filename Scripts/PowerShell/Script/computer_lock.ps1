Clear-Host
Write-Host "Verrouillage de $TargetComputeur en cours ..."
#Option Lock dans le fichier user32.dll avec la commande rundll32.exe
rundll32.exe user32.dll,LockWorkStation
Write-Host "Verrouillage effectuer"
Read-Host "Appuyez sur [Entrée] pour continuer"