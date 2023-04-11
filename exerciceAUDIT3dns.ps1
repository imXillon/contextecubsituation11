##############################
# nom : exerciceAUDIT3dns.ps1#
# Auteur : Antoine Ribeiro   #
# Date : 11/04/23            #
# version : 1                #
##############################

# Définition des variables
$date = Get-Date -Format "yyyy-MM-dd"
$fichier = "C:\auditDNS.txt"

# Récupération des enregistrements DNS de type A
$enregistrements = Get-DnsServerResourceRecord -ZoneName "local.edimbourg.cub.sioplc.fr" -RRType A

# Ecriture dans le fichier
Add-Content $fichier "Date d'exécution : $date"
Add-Content $fichier ""

foreach ($enregistrement in $enregistrements) {
    Add-Content $fichier "Nom : $($enregistrement.HostName)"
    Add-Content $fichier "Adresse IP : $($enregistrement.RecordData.IPv4Address)"
    Add-Content $fichier "---------------------------"
}

# Confirmation de l'enregistrement
Write-Host "Les enregistrements DNS de type A ont été enregistrés dans le fichier $fichier."
