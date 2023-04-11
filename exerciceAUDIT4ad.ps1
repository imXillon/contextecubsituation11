##############################
# nom : exerciceAUDIT4AD.ps1 #
# Auteur : Antoine Ribeiro   #
# Date : 11/04/23            #
# version : 1                #
##############################

# Définition des variables
$date = Get-Date -Format "yyyy-MM-dd"
$fichier = "C:\auditAD.txt"

# Récupération des comptes utilisateurs
$comptes = Get-ADUser -Filter *

# Ecriture dans le fichier
foreach ($compte in $comptes) {
    Add-Content $fichier "Date d'exécution : $date"
    Add-Content $fichier "Nom d'utilisateur : $($compte.SamAccountName)"
    Add-Content $fichier "Nom complet : $($compte.Name)"
    Add-Content $fichier "Description : $($compte.Description)"
    Add-Content $fichier "---------------------------"
}


