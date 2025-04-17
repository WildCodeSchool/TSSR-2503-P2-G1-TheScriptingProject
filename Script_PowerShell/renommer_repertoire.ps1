#Demander le nom du dossier à modifier
$nomDossier = Read-Host "Entrez le nom du dossier"
$chemin = Read-Host "Entrez le chemin complet"
Rename-Item $nomDossier
Write-Host "Le dossier a bien été renommé" -ForegroundColor Yellow