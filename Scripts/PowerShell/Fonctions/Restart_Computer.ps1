Clear-Host
Restart-Computer -ComputerName $TargetComputeur -Credential $Cred -Force
#Le -ComputerName est utiiser pour cibler une machine distante. 
#On peux utiliser la param -Force pour forcer le restart imediatement
