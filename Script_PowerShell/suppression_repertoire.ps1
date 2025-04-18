#Demander le nom du dossier à supprimer
$nomDossier = Read-Host "Entrez le nom du dossier"
$chemin = Read-Host "Entrez le chemin complet"
Remove-Item $nomDossier
Write-Host "`nLe dossier et son contenu ont été supprimer" -ForegroundColor Green