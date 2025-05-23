clear

#Vérifier le statut du pare-feu
$firewall_status = Get-NetFirewallProfile | Select-Object -ExpandProperty Enabled

#Statut du pare-feu
if ($firewall_status -eq $False) {
#Demande de désactivation
Write-Host "Le pare-feu est activé, voulez-vous le désactiver?(oui/non)"
$choix = Read-Host "reponse"

#Demande de désactivation
Write-Host "Le pare-feu est activé, voulez-vous le désactiver?(oui/non)"
$choix = Read-Host "reponse"

    #Lecture du choix
    switch ($choix) {

            "oui" { 
            Write-Host "Désactivation du pare-feu" -ForegroundColor Green
            Set-NetFirewallProfile -Enabled False
            Read-Host "Appuyez sur [Entrée] pour continuer"
        }   
            "non" {
            Write-Host "Aucun pare-feu de désactivé" -ForegroundColor Yellow
            Read-Host "Appuyez sur [Entrée] pour continuer"
        }
            default {
            Write-Host "Erreur: Répondre par oui ou non" -ForegroundColor Red
            Read-Host "Appuyez sur [Entrée] pour continuer"
        }
    }
}
else 
{
    #Désactivation déjà en place
    Write-Host "Le pare-feu est déjà désactivé"
    Read-Host "Appuyez sur [Entrée] pour continuer"
}
