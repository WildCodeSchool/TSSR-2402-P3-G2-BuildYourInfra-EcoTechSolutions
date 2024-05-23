###############################################################
#                                                             #
#   Création COMPUTER avec nombre aléatoire automatiquement   #
#                                                             #
###############################################################

### Parametre(s) à modifier

$NbUser = 30

### Main program

Clear-Host
$ADComputers = Get-ADComputer -Filter * -Properties *
$count = 1
Do
{
    $Nbr = Get-Random -Minimum 0 -Maximum 999
    $Name = "CLIENT0$Nbr"
    
    If (($ADComputers | Where {$_.Name -eq $Name}) -eq $Null)
    {
        Try        {            New-ADComputer -Name $Name -Enabled $True        }        Catch        {            Write-Host "L'ordinateur Name existe déjà" -ForegroundColor Black -BackgroundColor White        }      }
    Else
    {
        Write-Host "L'ordinateur Name existe déjà" -ForegroundColor Black -BackgroundColor Yellow
    }
    $Count++
    #sleep -Milliseconds 100
}
While ($Count -lt ($NbUser +1))