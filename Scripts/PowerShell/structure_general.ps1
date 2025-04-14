###############################
#                             #
# Les Fonctions des commandes #
#                             #
###############################

function FunctionName1 
{
        
}

function FunctionName2 
{
    
}

function FunctionName3 
{
    
}

#etc.

###############################
#                             #
# Les Switchs pour les menus  #
#                             #
###############################

$Read=Write-Host "Faite votre choix"
switch ($Read) 
{
    Choix_1 
    {
        Write-Host "Choix N°1"
    }
    Choix_2
    {
        Write-Host "Choix N°2"
    }
    Default 
    {
        Write-Host "Erreur choix"
    }
}
