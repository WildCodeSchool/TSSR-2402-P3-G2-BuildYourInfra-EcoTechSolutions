# Stockage avancé : Raid 1 sur Windows Server 2022 en GUI

## Sommaire

1) Ajout d'un disque sur Proxmox

2) Configuration du RAID en mode graphique

## Ajout d'un disque dur sur Proxmox

1. Avant de commencer, rendez-vous dans l'onglet `Snapshots` de votre serveur sur Proxmox, puis `Take Snapshot`.

![Raid](/S13/ressource/raid/Proxmox_01.PNG)

2. Remplissez le champ `Name` puis cliquez sur `Take Snapshot`.

![Raid](/S13/ressource/raid/Proxmox_02.PNG)

3. Rendez-vous ensuite dans l'onglet `Hardware`, puis `Add`, puis `Hard Disk`.

![Raid](/S13/ressource/raid/Proxmox_03.PNG)

4. Remplissez les champs `Storage = ceph-datas` et `Disk size = 100` (la taille du disque doit absolument être identique au volume existant qui sera pris en compte pour la RAID). Puis cliquez sur `Add`.

![Raid](/S13/ressource/raid/Proxmox_04.PNG)

5. Votre disque dur a bien été créé et ajouté. 

![Raid](/S13/ressource/raid/Proxmox_05.PNG)

## Configuration du Raid

1. Ouvrez le Gestionnaire de disques en recherchant `diskmgmt.msc` ou bien en faisant clic-droit sur le bouton `Windows` puis `Disk Management`.

![Raid](/S13/ressource/raid/GUI_Raid_01.PNG)

2. A l'ouvertyre, un message vous notifie que vous devez initialiser le nouveau disque afin de pouvoir y accéder. Cliquez sur `OK`.

![Raid](/S13/ressource/raid/GUI_Raid_02.PNG)

3. Faites clic-droit sur `Disk 0` puis `Convert to Dynamic Disk`.

![Raid](/S13/ressource/raid/GUI_Raid_03.PNG)

4. Sélectionnez `Disk 0` et `Disk 1` puis cliquez sur `OK`.

![Raid](/S13/ressource/raid/GUI_Raid_04.PNG)

5. Cliquez sur `Details` si vous souhaitez voir le détail, sinon `Convert`.

![Raid](/S13/ressource/raid/GUI_Raid_05.PNG)

6. Un message vous avertit qu'après la conversion, vous ne pourrez pas démarrer un autre système d'exploitation hormis celui déjà installé. Cliquez sur `Yes`.

![Raid](/S13/ressource/raid/GUI_Raid_06.PNG)

7. Faites clic-droit sur votre partition Windows `C:` puis `Add Mirror`.

![Raid](/S13/ressource/raid/GUI_Raid_07.PNG)

8. Sélectionnez le `Disk 1` puis cliquez sur `Add Mirror`.

![Raid](/S13/ressource/raid/GUI_Raid_08.PNG)

9. Les Volumes vont passés en status `Resynching`. Cette étape peut nécessiter un moment. Le pourcentage de progression apparait dans la partition. Veuillez être patient.

![Raid](/S13/ressource/raid/GUI_Raid_09.PNG)

10. Une fois la synchronisation terminée, les volumes repassent en status `Healthy`. Votre RAID est opérationnel.