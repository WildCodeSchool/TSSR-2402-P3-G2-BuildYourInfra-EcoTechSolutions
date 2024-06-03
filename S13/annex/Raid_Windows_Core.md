# Stockage avancé

## Mise en place du RAID 1 sur Windows Core

### 1. Pré-requis techniques

**_ECO-Moldaver_**
* Windows Server 2022 en Core
* IP : `10.10.8.120/25`
* Rôle : Réplication ADDS
* IDE0 : 1 HDD de 100 Go

### 2. Ajout d'un disque dur sur Proxmox

1. Avant de commencer, rendez-vous dans l'onglet `Snapshots` de votre serveur sur Proxmox, puis `Take Snapshot`.

![Raid](/ressource/S13/raid/Proxmox_01.PNG)

2. Remplissez le champ `Name` puis cliquez sur `Take Snapshot`.

![Raid](/ressource/S13/raid/Proxmox_02.PNG)

3. Rendez-vous ensuite dans l'onglet `Hardware`, puis `Add`, puis `Hard Disk`.

![Raid](/ressource/S13/raid/Proxmox_03.PNG)

4. Remplissez les champs `Storage = ceph-datas` et `Disk size = 100` (la taille du disque doit absolument être identique au volume existant qui sera pris en compte pour la RAID). Puis cliquez sur `Add`.

![Raid](/ressource/S13/raid/Proxmox_04.PNG)

5. Votre disque dur a bien été créé et ajouté. 

![Raid](/ressource/S13/raid/Proxmox_05.PNG)

### 3. Configuration du Raid sous Powershell

1. Démarrez votre serveur, puis saisissez `15` dans le menu `SConfig` pour accéder à `Powershell`.

![Raid](/ressource/S13/raid/Core_Raid_01.PNG)

2. Rendez-vous dans le gestionnaire de disques avec la commande `Diskpart` puis assurez-vous de la présence du disque dut qui vient d'être alloué au matériel avec la commande `list disk`. 

![Raid](/ressource/S13/raid/Core_Raid_02.PNG)

3. Nous allons à présent nettoyer le disque 1 et le convertir en GPT.  
```
select disk 1
clean
convert GPT
list part
```

![Raid](/ressource/S13/raid/Core_Raid_03.PNG)

4. Nous allons supprimer la partition `Reserved` du disque 1.  
```
select part 1
delete partition override
```

![Raid](/ressource/S13/raid/Core_Raid_04.PNG)

5. Affichez les informations du disque 0.  
```
select disk 0
list part
```
```
System – 100MB est une partition EFI (Extensible Firmware Interface) qui contient les informations de démarrage de Windows

Reserved – 16MB est une partition MSR (Microsoft Reserved Partition) conçue pour allouer de l’espace disque à un système d’exploitation Windows

Primary – 99GB est la partition principale sur laquelle un des système d'exploitation est démarré au lancement de l'ordinateur

Recovery – 524MB est la partition de récupération avec WinRE (Windows Recovery Environment) destinée à vous aider à restaurer votre Windows ou à résoudre les problèmes du système
```

![Raid](/ressource/S13/raid/Core_Raid_05.PNG)

6. Nous allons désormais créer sur le disque 1 la même structure de partitions que sur le disque 0.  
```
select disk 1
create partition primary size=450
format quick fs=ntfs label="WinRE"
set id="de94bba4-06d1-4d40-a16a-bfd50179d6ac"
create partition efi size=99
create partition msr size=16
list part
```

![Raid](/ressource/S13/raid/Core_Raid_06.PNG)

7. Nous allons ensuite convertir les disques en disques dynamiques.
```
select disk 0
convert dynamic
select disk 1
convert dynamic
```

![Raid](/ressource/S13/raid/Core_Raid_07.PNG)

8. Nous allons à présent créer un miroir du volume `C:` sur le disque 1.
```
select volume c
add disk=1
```

![Raid](/ressource/S13/raid/Core_Raid_08.PNG)

9. Votre RAID 1 est à présent opérationnel. Sortez de `Diskpart` avec la commande `exit`, puis redémarrez votre serveur.  
Au démarrage, vous aurez le choix entre `Windows Server` et `Windows Server - secondary plex`, sélectionnez `Windows Server` ou attendez 30 secondes et Windows va démarrer automatiquement.  
Faites un snapshot sur **Proxmox**

![Raid](/ressource/S13/raid/Core_Raid_09.PNG)