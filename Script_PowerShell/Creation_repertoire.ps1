#Demander le nom du dossier à créer
$nomDossier = Read-Host "Entrez le nom du dossier"
$chemin = Read-Host "Entrez le chemin complet"
New-Item -ItemType Directory -Name $nomDossier -Path $chemin
Write-Host "Répertoire créé" -ForegroundColor Green