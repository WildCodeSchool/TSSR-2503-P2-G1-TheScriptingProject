#Demander le nom du dossier à modifier
$nomDossier = Read-Host "Entrez le nom du dossier"
#Demander le chemin jusqu'au dossier
$chemin = Read-Host "Entrez le chemin complet"
#Renommer le dossier
Rename-Item $nomDossier
#Validation du nouveau nom de dossier
Write-Host "`nLe dossier a bien été renommé" -ForegroundColor Yellow