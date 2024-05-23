#############################
#                           #
#   Rangement ORDINATEURS   #
#                           #
#############################

$Computers = Get-ADComputer -Filter * -SearchBase "cn=Computers,dc=lab,dc=lan"
$TargetPath = "ou=LabOrdinateurs,dc=lab,dc=lan"
Foreach ($Computer in $Computers)
{
    Move-ADObject -Identity $Computer.ObjectGUID -TargetPath $TargetPath -Confirm:$false
}