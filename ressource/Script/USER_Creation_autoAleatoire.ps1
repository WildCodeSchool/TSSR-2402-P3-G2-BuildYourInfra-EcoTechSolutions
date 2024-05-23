###########################################################
#                                                         #
#   Création USER avec nombre aléatoire automatiquement   #
#                                                         #
###########################################################

### Parametre(s) à modifier

$NbUser = 200

### Main program

Clear-Host
$ADUsers = Get-ADUser -Filter * -Properties *
$count = 1
Do
{
    $Nbr = Get-Random -Minimum 10 -Maximum ($NbUser * 10)
        
    $Name              = "User$Nbr"
    $DisplayName       = $Name
    $SamAccountName    = $Name
    $UserPrincipalName = ($Name + "@" + (Get-ADDomain).Forest)
    $GivenName         = "Prenom"
    $Surname           = "Nom"
    $EmailAddress      = $UserPrincipalName
    $Path              = "ou=LabUtilisateurs,dc=lab,dc=lan"
    $Company           = "Ma Societe"
    $Department        = "Service"
    
    If (($ADUsers | Where {$_.SamAccountName -eq $SamAccountName}) -eq $Null)
    {
        Try        {            New-ADUser -Name $Name -DisplayName $DisplayName -SamAccountName $SamAccountName -UserPrincipalName $UserPrincipalName `                -GivenName $GivenName -Surname $Surname -EmailAddress $EmailAddress `                -Path $Path -AccountPassword (ConvertTo-SecureString -AsPlainText Azerty1* -Force) -Enabled $True `                -OtherAttributes @{Company = $Company;Department = $Department} -ChangePasswordAtLogon $True            Write-Host "Création du USER $SamAccountName" -ForegroundColor Green        }        Catch        {            Write-Host "Le USER $SamAccountName existe déjà" -ForegroundColor Black -BackgroundColor White        }      }
    Else
    {
        Write-Host "Le USER $SamAccountName existe déjà" -ForegroundColor Black -BackgroundColor Yellow
    }
    $Count++
    #sleep -Milliseconds 100
}
While ($Count -lt ($NbUser +1))