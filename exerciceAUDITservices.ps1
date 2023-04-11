$currentTime = Get-Date
$outputFile = "C:\auditServices.txt"

$dhcpService = Get-Service -Name dhcp
$dnsService = Get-Service -Name dns
$adService = Get-Service -Name adws

if (($dhcpService.Status -eq "Running") -and ($dnsService.Status -eq "Running") -and ($adService.Status -eq "Running")) {
    Add-Content -Path $outputFile -Value "Les services DHCP, DNS et AD sont en cours d'exécution à $currentTime"
} else {
    Add-Content -Path $outputFile -Value "Au moins l'un des services DHCP, DNS ou AD n'est pas en cours d'exécution à $currentTime"
}
