Clear-Host
##################################
#                                #
#   Suppression USER dans l'AD   #
#                                #
##################################

### Paramètres à modifier
# Liste des utilisateurs en bypass
$BypassUsers = @("Administrator", "Guest", "DefaultAccount", "User1", "User2", "wilder", "krbtgt", "adminlab")

### Main
$ADUsersWithBypassUsers = Get-ADUser -Filter * | Where-Object {$_.Name -notin $BypassUsers} | Remove-ADUser -Confirm:$false