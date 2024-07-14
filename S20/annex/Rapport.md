# Compte-rendu de fin de projet

## Schéma d'infrastructure (mis à jour le 13/07/2024)

![Ecotech](/S20/ressource/Schema_Infra.PNG)

## Synthèse des matériels (mis à jour le 13/07/2024)

| Nom du Matériel | Type | OS | Fonction | Configuration IP | Hard Disk | RAM |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| ECO-Maximus | VM | Windows Server 2022 | DHCP / DNS / ADDS | 10.10.8.100/16 | HDD 1 (100Go/0Go/0%) - HDD2 (100Go/0Go/0%) - HDD3 (100Go/0Go/0%) | 8Go/67% |
| ECO-Moldaver | VM | Windows Server 2022 Core | DNS / ADDS | 10.10.8.120/16 | HDD 1 (32Go/0Go/0%) - HDD 2 (32Go/0Go/0%) | 2Go/44% |
| ECO-Lucy | VM | Debian 12 | SSH / GLPI | 10.10.8.50/16 | HDD 1 (32Go/0Go/0%) - HDD 2 (32Go/0Go/0%) - HDD3 (32Go/0Go/0%) | 8Go/15% |
| ECO-LP-001 | VM | Windows 10 Pro | Putty / Firefox / Thunderbird | 10.10.8.2/25 | HDD1 (50Go/0Go/0%) | 4Go/78% |

## Synthèse de la documentation (mis à jour le 13/07/2024)

| Nom du Matériel | Appliance | Installation | Configuration | Utilisation |
| :-: | :-: | :-: | :-: | :-: |
| ECO-Maximus | DHCP | [Doc à jour](/S09/annex/DHCP_WinServGUI.md) | [Doc à jour](/S09/annex/DHCP_WinServGUI.md) | Inexistante () |
| ECO-Maximus | DNS | [Doc à jour](/S09/annex/DNS_WinServGUI.md) | [Doc à jour](/S09/annex/DNS_WinServGUI.md) | Inexistante () |
| ECO-Maximus | ADDS | [Doc à jour](/S09/annex/ADDS_WinServGUI.md) | [Doc à jour](/S10/annex/ADDS_Conf_WinServGUI.md) | Inexistante () |
| ECO-Moldaver | ADDS | [Doc à jour](/S10/annex/ADDS_WinServCore.md) | [Doc à jour](/S10/annex/ADDS_WinServCore.md) | Inexistante () |
| ECO-Lucy | SSH | [Doc à jour](/S11/annex/SSH.md) | [Doc à jour](/S11/annex/SSH.md) | Inexistante () |
| ECO-Lucy | GLPI | [Doc à jour](/S11/annex/GLPI.md) | [Doc à jour](/S11/annex/GLPI.md) | [Doc à Mettre à jour](/S11/S11_USER_GUIDE.md) |
| ECO-LP-001 | Putty | [Doc à jour](/S11/annex/SSH.md) | [Doc à jour](/S11/annex/SSH.md) | Inexistante () |
