#########################################################
#                                                       #
#             AJOUT OU DANS ACTIVE DIRECTORY            #
#                                                       #
#########################################################

Clear-Host

### Initialisation des paramètres génériques

$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)
$DomainDN = (Get-ADDomain).DistinguishedName

### Pré-requis

If (-not(Get-Module -Name ActiveDirectory))
{
    Install-Module -Name ActiveDirectory   
}

### Parametres spécifiques

$DataFile = "$FilePath\Sources\Data\Data_OU_Create.csv"
$OUMain = "EcoT_France"

### Main Program

$DataOU = Import-Csv -Path $DataFile -Delimiter ";" -Header "Service","Departement","Utility","Location","Main" | Select-Object -Skip 1

# Fonction de création OU
function OUCreate
{
    param (
        [Parameter(Mandatory = $true)][string]$OUName,
        [Parameter(Mandatory = $true)][string]$DNPath
    )

    # Vérifier si l'OU existe déjà
    if ((Get-ADOrganizationalUnit -Filter {Name -like $OUName} -SearchBase $DNPath) -eq $Null)
    {
        New-ADOrganizationalUnit -Name $OUName -Path $DNPath
        $EventLogTask = "Ajout de l'OU $OUName"
        EventLogAD
        Write-Host "Création de l'OU $OUName dans AD" -ForegroundColor Green
        Set-ADOrganizationalUnit -Identity $DNPath -ProtectedFromAccidentalDeletion:$true
    }
    else {
        Write-Host "L'OU $OUName existe déjà" -ForegroundColor Yellow
    }
}

# Création de l'OU principale dans le Domaine

if ((Get-ADOrganizationalUnit -Filter {Name -like $OUMain} -SearchBase $DNDomain) -eq $Null)
{
    # Si elle n'existe pas
    New-ADOrganizationalUnit -Name $OUMain -Path $DomainDN
    $EventLogTask = "Ajout de l'OU $OUMain dans le Domaine"
    EventLogAD
    Write-Host "Création de l'OU $OUMain dans AD"
}
else
{
    Write-Host "L'OU $OUMain existe déjà"
}


# Boucle pour parcourir le fichier csv

foreach ($Data in $DataOU)
{
    $Service = $Data.Service
    $Departement = $Data.Departement
    $Utility = $Data.Utility
    $Location = $Data.Location
    $Main = $Data.Main

    # Création de l'OU Location
    if ($Location -ne "")
    {
        $OUPath = "OU=$Main,$DNDomain"
        OUCreate -OUName $Location -DNPath $OUPath
    }

    # Création de l'OU Utility
    if ($Utility -ne "")
    {
        $OUPath = "OU=$Location,OU=$Main,$DNDomain"
        OUCreate -OUName $Utility -DNPath $OUPath
    }

    # Création de l'OU Département
    if ($Departement -ne "")
    {
        $OUPath = "OU=$Utility,OU=$Location,OU=$Main,$DNDomain"
        OUCreate -OUName $Departement -DNPath $OUPath
    }

    # Création de l'OU Service
    if ($Service -ne "")
    {
        $OUPath = "OU=$Departement,OU=$Utility,OU=$Location,OU=$Main,$DNDomain"
        OUCreate -OUName $Service -DNPath $OUPath
    }
}