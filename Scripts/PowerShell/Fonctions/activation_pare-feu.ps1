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
        }
            "non" {
            Write-Host "Aucun pare-feu d'activé" -ForegroundColor Yellow
        }
            default {
            Write-Host "Erreur: Répondre par oui ou non" -ForegroundColor Red
        }
    }
}
else
{
#Demande d'activation
Write-Host "Le pare-feu est déjà activé"
exit 0
}