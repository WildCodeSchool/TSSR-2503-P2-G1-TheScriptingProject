#Demander le nom du dossier à créer
$nomDossier = Read-Host "Entrez le nom du dossier"
#Demander le chemin complet où créer le dossier
$chemin = Read-Host "Entrez le chemin complet"
#Créer le dossier
Write-Host "Création du dossier en cours"
New-Item -ItemType Directory -Name $nomDossier -Path $chemin
#Validation de la création
Write-Host "`nRépertoire créé" -ForegroundColor Green
Read-Host "Appuyez sur [Entrée] pour continuer"
