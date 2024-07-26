# Compte-rendu de fin de projet

## Sommaire

1) Schéma d'infrastructure

2) Synthèse des matériels

3) Synthèse de la documentation

4) Index de la documentation

## Schéma d'infrastructure (mis à jour le 15/07/2024)

![Ecotech](/S20/ressource/EcoTech_Schema.png)

## Synthèse des matériels (mis à jour le 15/07/2024)

| Nom du Matériel | Type | OS | Fonction | Configuration IP | Hard Disk | RAM |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| ECO-Maximus | VM | Windows Server 2022 | DHCP / DNS / ADDS / FSMO/ PingCastle | 10.10.8.100/25 | HDD1(100Go/54Go/64%) HDD2(100Go/54Go/64%) HDD3(100Go/5Go/5%) | 8Go/62% |
| ECO-Moldaver | VM | Windows Server 2022 Core | DNS / ADDS / FSMO (RID) | 10.10.8.120/25 | HDD1(32Go/18Go/56%) | 2Go/44% |
| ECO-Lucy | VM | Debian 12 | SSH / GLPI | 10.10.8.50/25 | HDD1(32Go/25Go/80%) HDD2(32Go/25Go/82%) - HDD3 (35Go/34Go/98%) | 8Go/15% |
| ECO-LP-001 | VM | Windows 10 Pro | Putty / Firefox / Thunderbird / 3CXPhone | 10.10.8.2/25 | HDD1(50Go/19Go/38%) | 4Go/78% |
| ECO-ROOT-01 | VM | VyOS | VyOS | 5 cartes réseaux | HDD1(4Go/0G/0%) | 1Go/73% |
| ECO-ROOT-02 | VM | VyOS | VyOS | 4 cartes réseaux | HDD1(4Go/0G/0%) | 1Go/73% |
| ECO-ROOT-03 | VM | VyOS | VyOS | 4 cartes réseaux | HDD1(4Go/0G/0%) | 1Go/73% |
| ECO-FW-01 | VM | Debian 12 | PFSense | 4 cartes réseaux | HDD1(6Go/3Go/60%) | 2Go/65% |
| CanigouGrafana | CT | Debian 12 | Grafana | 10.10.8.113/25 | HDD1(25Go/23Go/93%) | 512Mo/15% |
| TychoProm | CT | Debian 12 | Prometheus | 10.10.8.114/25 | HDD1(20Go/17Go/87%) | 512Mo/15% |
| IanMail | CT | Debian 12 | IRedMail | 10.10.8.116/25 | HDD1(20Go/1Go/5%) | 2Go/28% |
| Tandy | CT | Debian 12 | Redmine | 10.10.8.118/25 | HDD1(30Go/27Go/91%) | 3Go/12% |
| ECO-KaliTest | VM | Kali Linux | Pentest / BloodHound | 10.10.200.50/16 | HDD1(100Go/0Go/0%) | 4Go/ 90% |
| ECO-ChefGoule | VM | Debian 12 | Apache Guacamole | 10.11.0.2/16 | HDD1(16Go/0Go/0%) | 4Go/30% |
| KatjaBit | CT | Debian 12 | Bitwarden | 10.10.8.117/25 | HDD1(25Go/2Go/5%) | 4Go/42% |
| ECO-Thaddeus | VM | Windows Server 2022 | WSUS | 10.10.8.109/25 | HDD1(32Go/9Go/31%) HDD2(32Go/0Go/0%) HDD3(32Go/Unallocated) | 4Go/55% |
| ECO-Dane | VM | RedHat FreePBX | FreePBX | 10.10.8.51/25 | HDD1(32Go/1Go/4%) | 4Go/57% |
| MacLeanAnsi | CT | Debian 12 | Ansible | 10.10.8.104/25 | HDD1(32Go/6Go/80%) | 4Go/58% |
| PorcaMiseria | CT | Debian 12 | Apache | 10.11.0.8/16 | HDD1(8Go/6Go/82%) | 2Go/3% |
| ECO-Titus | VM | Windows Server 2022 Core | DNS / ADDS / FSMO (PDC) | 10.10.8.121/25 | HDD1(32Go/18Go/56%) | 2Go/44% |
| ECO-LP-002 | VM | Windows 10 Pro | Putty / Firefox / Thunderbird / 3CXPhone | 10.10.8.2/25 | HDD1(50Go/19Go/38%) | 4Go/78% |
| ECO-Biscotto | VM | Ubuntu 22.04 | SSH / Snort | 10.10.8.56/25 | HDD1(32Go/14Go/45%) | 4Go/ 40% |

## Synthèse de la documentation (mis à jour le 15/07/2024)

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
| ECO-Dane | FreePBX | [Doc à jour](/S17/annex/FreePBX.md) | [Doc à jour](/S17/annex/FreePBX.md) | Inexistante () |
| MacLeanAnsi | Ansible | [Doc à jour](/S17/annex/Ansible.md) | [Doc à jour](/S17/annex/Ansible.md) | Inexistante () |
| PorcaMiseria | Apache | [Doc à jour](/S17/annex/Web_Apache.md) | [Doc à jour](/S17/annex/Web_Apache.md) | Inexistante () |
| ECO-KaliTest | BloodHound | [Doc à jour](/S18/annex/BloodHound.md) | [Doc à peaufiner](/S18/annex/BloodHound.md) | Inexistante () |
| ECO-Maximus | PingCastle | [Doc à jour](/S18/annex/PingCastle.md) | [Doc à jour](/S18/annex/PingCastle.md) | Inexistante () |
| ECO-Biscotto | Snort | [Doc à jour](/S19/annex/Snort.md) | [Doc à jour](/S19/annex/Snort.md) | Inexistante () |

## Index de la documentation (mis à jour le 14/07/2024)

Vous trouverez un Index complet de la documentation répertoriant par ordre alphabétique les différents éléments et procédures de l'Infrastructure : [Index](/S20/annex/Index.md).
