###############################################################
#                                                             #
#            AJOUT COMPUTER DANS ACTIVE DIRECTORY             #
#                                                             #
###############################################################

Clear-Host

### Initialisation des paramètres génériques

$DomainDN = (Get-ADDomain).DistinguishedName

### Pré-requis

If (-not(Get-Module -Name ActiveDirectory))
{
    Install-Module -Name ActiveDirectory   
}

### Parametres spécifiques

$OuComputers = "EcoT_Computers"
$OUPathComputers = "OU=EcoT_Computers,OU=EcoT_Bordeaux,OU=EcoT_France,$DomainDN"

### Main program

$ComputerCount = Read-Host "Combien souhaitez-vous créer d'ordinateurs dans Active Directory ? "

$ADComputers = Get-ADComputer -Filter * -Properties *
$Count = 1

Do
{

    If ($Count -lt 10)
    {
        $ComputerName = "ECO-LP-000$Count"
    
        If (($ADComputers | Where {$_.Name -eq $ComputerName}) -eq $Null)
        {
            Try
            {
                New-ADComputer -Name $ComputerName -Path $OUPathComputers -Enabled $True
                $EventLogTask = "Ajout de l'ordinateur $ComputerName dans AD"
                EventLogAD
                Write-Host "Création du COMPUTER $ComputerName dans l'OU $OUComputers" -ForegroundColor Green
            }
            Catch
            {
                Write-Host "L'ordinateur $ComputerName existe déjà" -ForegroundColor White
            }  
        }
        Else
        {
            Write-Host "L'ordinateur $ComputerName existe déjà" -ForegroundColor Yellow
        }

        $Count = $Count + 1
        sleep -Milliseconds 100

    }

    If (($Count -ge 10) -and ($count -lt 100))
    {
        $ComputerName = "ECO-LP-00$Count"
    
        If (($ADComputers | Where {$_.Name -eq $ComputerName}) -eq $Null)
        {
            Try
            {
                New-ADComputer -Name $ComputerName -Path $OUPathComputers -Enabled $True
                $EventLogTask = "Ajout de l'ordinateur $ComputerName dans AD"
                EventLogAD
                Write-Host "Création du COMPUTER $ComputerName dans l'OU $OUComputers" -ForegroundColor Green
            }
            Catch
            {
                Write-Host "L'ordinateur $ComputerName existe déjà" -ForegroundColor White
            }  
        }
        Else
        {
            Write-Host "L'ordinateur $ComputerName existe déjà" -ForegroundColor Yellow
        }

        $Count = $Count + 1
        sleep -Milliseconds 100

    }

    If (($Count -ge 100) -and ($count -lt 1000))
    {
        $ComputerName = "ECO-LP-0$Count"
    
        If (($ADComputers | Where {$_.Name -eq $ComputerName}) -eq $Null)
        {
            Try
            {
                New-ADComputer -Name $ComputerName -Path $OUPathComputers -Enabled $True
                $EventLogTask = "Ajout de l'ordinateur $ComputerName dans AD"
                EventLogAD
                Write-Host "Création du COMPUTER $ComputerName dans l'OU $OUComputers" -ForegroundColor Green
            }
            Catch
            {
                Write-Host "L'ordinateur $ComputerName existe déjà" -ForegroundColor White
            }  
        }
        Else
        {
            Write-Host "L'ordinateur $ComputerName existe déjà" -ForegroundColor Yellow
        }

        $Count = $Count + 1
        sleep -Milliseconds 100

    }

}
While ($Count -le $ComputerCount)

Write-Host ""