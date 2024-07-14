# Stockage avancé : Raid 1 sur Debian 12

## Sommaire

1) Installation de la VM depuis un .iso

## Installation de la VM depuis un .iso

L'objectif ici est de mettre en place un RAID 1, soit du mirroring entre les 2 disques. Les données sont copiées simultanément sur deux disques. Ainsi en cas de panne d'un des disques, les données sont toujours disponibles sur le disque restant. Pour réaliser cette objectif, nous avons dû installer une VM Debian depuis le début.

![](/S13/ressource/raid_deb/Debian-raid(1).png)

### Mise en place du RAID logiciel

Débutez l'installation de Debian... Effectuez notamment le choix de la langue, la configuration réseau, choisissez un nom pour votre machine et un mot de passe pour le compte root. Ensuite, vous arriverez à la gestion du stockage (voir image ci-dessous), choisissez "Manuel" puisque les modes assistés ne nous seront pas utiles dans ce cas précis.

![](/S13/ressource/raid_deb/Debian-raid(2).png)

Sélectionnez le premier disque, pour ma part il s'agit de sda. Faites Entrée.

![](/S13/ressource/raid_deb/Debian-raid(3).png)

Sélectionnez "Oui" et poursuivez afin de créer une nouvelle table de partitions sur ce disque.

![](/S13/ressource/raid_deb/Debian-raid(4).png)

La table de partition étant créée, nous allons créer une nouvelle partition, sélectionnez la ligne sous sda mentionnant l'espace libre.

![](/S13/ressource/raid_deb/Debian-raid(5).png)

Sélectionnez "Créer une nouvelle partition" et appuyez sur Entrée.

![](/S13/ressource/raid_deb/Debian-raid(6).png)

On indique la taille de partition, il s'agira de ma partition principale où sera installé le système. J'attribue 32 Go sur les 34.4 Go disponibles. Sélectionnez "Continuer" et validez.

![](/S13/ressource/raid_deb/Debian-raid(7).png)

Choisissez de créer une partition "Primaire" et l'emplacement "Début".

![](/S13/ressource/raid_deb/Debian-raid(8).png)

![](/S13/ressource/raid_deb/Debian-raid(9).png)

Au niveau des caractéristiques, sélectionnez la ligne "Utiliser comme :" et appuyez sur "Entrée".

![](/S13/ressource/raid_deb/Debian-raid(10).png)

A la place de l'entrée par défaut "système de fichiers journalisé ext4", sélectionnez plutôt "volume physique pour RAID" et validez.

![](/S13/ressource/raid_deb/Debian-raid(11).png)

Il ne reste plus qu'à faire "Fin du paramétrage de cette partition".

![](/S13/ressource/raid_deb/Debian-raid(12).png)

Répétez les opérations précédentes afin de créer une partition avec l'espace disque restant sur le disque sda, puis, une partition 32 Go sur le second disque sdb mais aussi une seconde partition avec l'espace disque restant. Pensez bien à sélectionnez "volume physique pour RAID" à chaque fois. Vous devez arriver au résultat suivant :

![](/S13/ressource/raid_deb/Debian-raid(13).png)

![](/S13/ressource/raid_deb/Debian-raid(14).png)

Si c'est le cas, sélectionnez "Configurer le RAID avec gestion logicielle" et appuyez sur Entrée.

Lorsque l'on vous demande si vous souhaitez appliquer des changements à vos disques sda et sdb, choisissez "Oui".

![](/S13/ressource/raid_deb/Debian-raid(15).png)

La création et la gestion du RAID logiciel s'appuie sur MDADM, c'est par son intermédiaire que se configure le RAID que nous mettons en place. Choisissez "Créer un périphérique multidisque".

![](/S13/ressource/raid_deb/Debian-raid(16).png)

Nous devons choisir "RAID1" puisque ce tutoriel concerne le RAID1.

![](/S13/ressource/raid_deb/Debian-raid(17).png)

Indiquez "2" puisque l'ensemble RAID contiendra deux périphériques actifs, c'est à dire sda et sdb. Continuer.

![](/S13/ressource/raid_deb/Debian-raid(18).png)

Indiquez "0" car nous n'avons pas de périphériques de réserve, c'est à dire de disque dur de spare déjà présent dans la machine et prêt à prendre le relais en cas de panne.

![](/S13/ressource/raid_deb/Debian-raid(19).png)

Sélectionnez les partitions à ajouter à ce premier groupe de RAID logiciel, sélectionnez "sda1" et "sdb1" qui correspondent aux deux partitions de 32 Go pour le système. Continuer.

![](/S13/ressource/raid_deb/Debian-raid(20).png)

Sélectionnez à nouveau "Créer un périphérique multidisque" et effectuez la même procédure que précédemment sauf que cette fois-ci on sélectionnera les deux autres partitions (sda2 et sdb2).

![](/S13/ressource/raid_deb/Debian-raid(21).png)

![](/S13/ressource/raid_deb/Debian-raid(22).png)

Nous avons terminé la création des deux groupes de RAID, faites donc Terminer.

![](/S13/ressource/raid_deb/Debian-raid(23).png)

Vous devriez obtenir un résumé précisant la présence de deux périphériques RAID1, le numéro 0 d'une taille de 32 Go et le numéro 1 d'une taille de 2.4 Go.

Pour le premier (32 Go), sélectionnez le volume et appuyez sur Entrée afin de définir le système de fichiers ext4 et le point de montage "/". Pour le second, faites la même chose et sélectionnez SWAP afin d'utiliser cet espace comme de la SWAP.

Vous devez obtenir un résultat semblable à la copie d'écran ci-dessous. Si c'est bien le cas, sélectionnez "Terminer le partitionnement et appliquer les changements".

![](/S13/ressource/raid_deb/Debian-raid(24).png)

![](/S13/ressource/raid_deb/Debian-raid(25).png)

Validez avec "Oui" pour appliquer les changements sur les disques.

![](/S13/ressource/raid_deb/Debian-raid(26).png)

### Vérification du RAID

Pour finir, une fois que la machine a terminée l'installation, nous allons vérifier que le RAID est bien opérationnel.

Commencez par saisir la commande suivante **`cat /proc/mdstat`**

Nous obtenons cette sortie :

![](/S13/ressource/raid_deb/Debian-raid(27).png)

Vous pouvez voir sur la sortie ci-dessus, que les RAID 1 sont bien présent et bien décris. Ce qui est intéressant, c'est la mention [UU] qui permet de voir que les deux disques sont opérationnels. Cela ne serait pas le cas si l'on aurait [_U] ou [U_].

De plus, chaque grappe RAID est définie sous la forme d'un identifiant "md<x>" où X est le numéro de la grappe RAID.

Voyons une seconde commande dans le but de visualiser en détails l'état d'un RAID, par exemple le md0 avec la commande suivante **`mdadm -D /dev/md0`**

Nous obtenons cette sortie :

![](/S13/ressource/raid_deb/Debian-raid(28).png)

On peut remarquer que deux périphériques sont actif et en cours (Active Devices / Working Devices), mais aussi qu'ils sont bien en synchronisation active (State = active sync) ce qui est essentiel dans le cas de cette mise en place.