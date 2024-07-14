# Compte-rendu de fin de projet

## Schéma d'infrastructure (mis à jour le 14/07/2024)

![Ecotech](/S20/ressource/Schema_Infra.PNG)

## Synthèse des matériels (mis à jour le 14/07/2024)

| Nom du Matériel | Type | OS | Fonction | Configuration IP | Hard Disk | RAM |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| ECO-Maximus | VM | Windows Server 2022 | DHCP / DNS / ADDS | 10.10.8.100/25 | HDD 1 (100Go/0Go/0%) - HDD2 (100Go/0Go/0%) - HDD3 (100Go/0Go/0%) | 8Go/67% |
| ECO-Moldaver | VM | Windows Server 2022 Core | DNS / ADDS | 10.10.8.120/25 | HDD 1 (32Go/0Go/0%) - HDD 2 (32Go/0Go/0%) | 2Go/44% |
| ECO-Lucy | VM | Debian 12 | SSH / GLPI | 10.10.8.50/25 | HDD 1 (32Go/0Go/0%) - HDD 2 (32Go/0Go/0%) - HDD3 (32Go/0Go/0%) | 8Go/15% |
| ECO-LP-001 | VM | Windows 10 Pro | Putty / Firefox / Thunderbird | 10.10.8.2/25 | HDD1 (50Go/0Go/0%) | 4Go/78% |
| ECO-ROOT-01 | VM | VyOS | VyOS | 5 cartes réseaux | HDD 1 (4Go/0G/0%) | 1Go/73% |
| ECO-ROOT-02 | VM | VyOS | VyOS | 4 cartes réseaux | HDD 1 (4Go/0G/0%) | 1Go/73% |
| ECO-ROOT-03 | VM | VyOS | VyOS | 4 cartes réseaux | HDD 1 (4Go/0G/0%) | 1Go/73% |
| ECO-FW-01 | VM | Debian 12 | PFSense | 4 cartes réseaux | HDD 1 (6Go/0Go/0%) | 2Go/65% |
| CanigouGrafana | CT | Debian 12 | Grafana | 10.10.8.113/25 | HDD 1 (25Go/23Go/93%) | 512Mo/15% |
| TychoProm | CT | Debian 12 | Prometheus | 10.10.8.114/25 | HDD 1 (20Go/17Go/87%) | 512Mo/15% |
| IanMail | CT | Debian 12 | IRedMail | 10.10.8.116/25 | HDD 1 (20Go/1Go/5%) | 2Go/28% |
| Tandy | CT | Debian 12 | Redmine | 10.10.8.118/25 | HDD 1 (30Go/27Go/91%) | 3Go/12% |
| ECO-KaliTest | VM | Kali Linux | Pentest | 10.10.200.50/16 | HDD 1 (100Go/0Go/0%) | 4Go/ 90% |
| ECO-ChefGoule | VM | Debian 12 | Apache Guacamole | 10.11.0.2/16 | HDD 1 (16Go/0Go/0%) | 4Go/30% |
| KatjaBit | CT | Debian 12 | Bitwarden | 10.10.8.117/25 | HDD 1 (25Go/2Go/5%) | 4Go/42% |
| ECO-Thaddeus | VM | Windows Server 2022 | WSUS | 10.10.8.109/25 | HDD 1 (32Go/9Go/31%) - HDD 2 (32Go/0Go/0%) - HDD 3 (32Go/32Go/100%) | 4Go/55% |

## Synthèse de la documentation (mis à jour le 14/07/2024)

| Nom du Matériel | Appliance | Installation | Configuration | Utilisation |
| :-: | :-: | :-: | :-: | :-: |
| ECO-Maximus | DHCP | [Doc à jour](/S09/annex/DHCP_WinServGUI.md) | [Doc à jour](/S09/annex/DHCP_WinServGUI.md) | Inexistante () |
| ECO-Maximus | DNS | [Doc à jour](/S09/annex/DNS_WinServGUI.md) | [Doc à jour](/S09/annex/DNS_WinServGUI.md) | Inexistante () |
| ECO-Maximus | ADDS | [Doc à jour](/S09/annex/ADDS_WinServGUI.md) | [Doc à jour](/S10/annex/ADDS_Conf_WinServGUI.md) | Inexistante () |
| ECO-Moldaver | ADDS | [Doc à jour](/S10/annex/ADDS_WinServCore.md) | [Doc à jour](/S10/annex/ADDS_WinServCore.md) | Inexistante () |
| ECO-Lucy | SSH | [Doc à jour](/S11/annex/SSH.md) | [Doc à jour](/S11/annex/SSH.md) | Inexistante () |
| ECO-Lucy | GLPI | [Doc à jour](/S11/annex/GLPI.md) | [Doc à jour](/S11/annex/GLPI.md) | [Doc à Mettre à jour](/S11/S11_USER_GUIDE.md) |
| ECO-LP-001 | Putty | [Doc à jour](/S11/annex/SSH.md) | [Doc à jour](/S11/annex/SSH.md) | Inexistante () |
| ECO-ROOT-01 | VyOS | [Doc à jour](/S12/annex/Vyos.md) | [Doc à jour](/S12/annex/Vyos.md) | Inexistante () |
| ECO-ROOT-02 | VyOS | [Doc à jour](/S12/annex/Vyos.md) | [Doc à jour](/S12/annex/Vyos.md) | Inexistante () |
| ECO-ROOT-03 | VyOS | [Doc à jour](/S12/annex/Vyos.md) | [Doc à jour](/S12/annex/Vyos.md) | Inexistante () |
| ECO-FW-01 | PFSense | Inexistante () | [Doc à jour](/S12/annex/PFSense.md) | Inexistante () |
| ECO-Maximus | Backup | [Doc à jour](/S13/annex/Backup.md) | [Doc à jour](/S13/annex/Backup.md) | Inexistante () |
| ECO-Maximus | LAPS | [Doc à jour](/S13/annex/LAPS.md) | [Doc à jour](/S13/annex/LAPS.md) | Inexistante () |
| ECO-Lucy | Backup | [Doc à jour](/S14/annex/Backup_Debian.md) | [Doc à jour](/S14/annex/Backup_Debian.md) | Inexistante () |
| ECO-Moldaver | Backup | [Doc à jour](/S14/annex/Backup_Core.md) | [Doc à jour](/S14/annex/Backup_Core.md) | Inexistante () |
| CanigouGrafana | Supervision | [Doc à peaufiner](/S14/annex/Supervision.md) | [Doc à peaufiner](/S14/annex/Supervision.md) | Inexistante () |
| TychoProm | Supervision | [Doc à peaufiner](/S14/annex/Supervision.md) | [Doc à peaufiner](/S14/annex/Supervision.md) | Inexistante () |
| ECO-Maximus | Tiering Model | Inexistante () | [Doc à peaufiner](/S14/annex/Tiering_Model.md) | Inexistante () |
| IanMail | IRedMail | [Doc à jour](/S15/annex/IRedMail.md) | [Doc à jour](/S15/annex/IRedMail.md) | Inexistante () |
| Tandy | Redmine | [Doc à jour](/S15/annex/Redmine.md) | [Doc à jour](/S15/annex/Redmine.md) | [Doc à jour](/S15/S15_USER_GUIDE.md) |
| ECO-KaliTest | Pentest | [Doc à jour](/S15/annex/KaliLinux.md) | [Doc à jour](/S15/annex/KaliLinux.md) | Inexistante() |
| ECO-ChefGoule| Apache Guacamole | [Doc à jour](/S15/annex/Guacamole.md) | [Doc à jour](/S15/annex/Guacamole.md) | Inexistante () |
| KatjaBit | Bitwarden | [Doc à jour](/S15/annex/Bitwarden.md) | [Doc à jour](/S15/annex/Bitwarden.md) | Inexistante () |
| ECO-Thaddeus | WSUS | [Doc à jour](/S16/annex/WSUS.md) | [Doc à jour](/S16/annex/WSUS.md) | Inexistante () |