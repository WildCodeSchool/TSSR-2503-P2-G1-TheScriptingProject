clear

#Vérifier le statut du pare-feu
$firewall_status = Get-NetFirewallProfile | Select-Object -ExpandProperty Enabled

#Statut du pare-feu
if ($firewall_status -eq $True) {
#Demande d'activation
Write-Host "Le pare-feu est désactivé, voulez-vous l'activer?(oui/non)"
$choix = Read-Host "reponse"


    #Lecture du choix
    switch ($choix) {

            "oui" { 
            Write-Host "Activation du pare-feu" -ForegroundColor Green
            Set-NetFirewallProfile -Enabled True
            Read-Host "Appuyez sur [Entrée] pour continuer"
        }
            "non" {
            Write-Host "Aucun pare-feu d'activé" -ForegroundColor Yellow
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
#Demande d'activation
Write-Host "Le pare-feu est déjà activé"
Read-Host "Appuyez sur [Entrée] pour continuer"
}