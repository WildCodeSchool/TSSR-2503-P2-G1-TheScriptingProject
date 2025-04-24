Clear-Host
#On enregistre la "Politique d'execution du PC" dans la variable ExePolicie 
$ExePolicie=Get-ExecutionPolicy
#On verifie ExePolicie : si elle est pas "Bypass" ont la modifie sinon on continue
if ($ExePolicie -ne "Bypass") 
{
    Set-ExecutionPolicy Bypass -Force
}
#Import et install le module PSWindowsUpdate
Install-Module PSWindowsUpdate
#On recupere le nombre de MaJ dispo
$UpDate=Get-WindowsUpdate
#Si il n'y pas de MaJ dispo ont arrete le script
if ($UpDate.Count -eq 0)
{
    Write-Host "Pas de Mise à Jour disponible"
    Read-Host "Appuiez sur ENTER pour quitter ..."
    Exit 1
}
Write-Host "$($UpDate.Count) Mise à Jour trouvée. Installation des Mise à Jour ..."
Install-WindowsUpdate -AcceptAll
Write-Host "Mise à jour : Terminer."
#On remet la "Politique d'execution" comme on la trouver au debut
Set-ExecutionPolicy $ExePolicie -Force
Read-Host "Appuiez sur ENTER pour continuer ..."