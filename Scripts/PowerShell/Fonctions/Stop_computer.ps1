Clear-Host
Stop-Computer -ComputerName "CLIWIN01" -Credential $Cred -Force
#-WsmanAuthentication : parametre pour spécifier la methode (protocol) de communication distant
#-ComputerName : utiliser ce param pour faire la commande sur une machine distante