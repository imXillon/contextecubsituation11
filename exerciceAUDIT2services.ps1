##############################
# nom : exerciceAUDIT2.ps1   #
# Auteur : Antoine Ribeiro   #
# Date : 11/04/23            #
# version : 1                #
##############################
# Définition des variables
$currentTime = Get-Date
$outputFile = "C:\auditDHCP.txt"
$date = Get-Date -Format "yyyy-MM-dd"
$fichier = "C:\auditDHCP.txt"

# Récupération des plages DHCP présentes sur le serveur
$plages = Get-DhcpServerv4Scope

# Ecriture dans le fichier et affichage à l'écran
foreach ($plage in $plages) {
    $nom = $plage.Name
    $statut = $plage.State
    if ($statut -eq "Active") {
        Add-Content $fichier "$date - $nom : $statut"
        Write-Host "$date - $nom : $statut"
    } else {
        Add-Content $fichier "$(Write-Host $date - $nom : $statut -ForegroundColor Red)"
        Write-Host $date - $nom : $statut -ForegroundColor Red
    }
}
