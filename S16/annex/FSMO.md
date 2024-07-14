# Répartition des rôles FMSO

## Sommaire

1) Transfert des rôles sous Powershell

## Transfert des rôles sous Powershell

- Depuis le serveur maître: ECO-MAXIMUS

1. Tapez dans la barre de recherche "**ntdsutil.exe**".

![FSMO-1](/S16/ressource/FSMO/FSMO-1.png)

2. Une fois le terminal ouvert, tapez "**?**" pour afficher les commandes disponibles.

![FSMO-2](/S16/ressource/FSMO/FSMO-2.png)

3. Tapez la commande "**Roles**" pour passer en mode `FSMO Maintenance` et tapez de nouveau "**?**" pour afficher les commandes disponibles.

![FSMO-3](/S16/ressource/FSMO/FSMO-3.png)

4. Tapez la commande "**Connections**" pour passer en mode `server connections` et se connecter au serveur sur lequel transferer un des cinqs rôles FSMO.

5. Tapez la commande "**connect to server**" suivi du nom du serveur ciblé.

![FSMO-5](/S16/ressource/FSMO/FSMO-5.png)

6. Une fois la connexion établie, tapez les commandes "**Quit**" pour revenir en mode `FSMO Maintenance` et "**?**" pour réafficher la listes des commandes.

![FSMO-6](/S16/ressource/FSMO/FSMO-6.png)

7. Pour tranferer le rôle `Maître RID`  sur le serveur cible (par exemple), tapez la commande "**Transfer RID master**". Une fenêtre va s'ouvrir pour confirmer votre choix, validez en cliquant sur `yes`.

![FSMO-7](/S16/ressource/FSMO/FSMO-7.png)

8. Une récapitulation de la distribution des rôles FSMO s'affiche.

![FSMO-8](/S16/ressource/FSMO/FSMO-8.png)

9. Si d'autres rôle FSMO sont à distribuer, recommencer à partir l'étape `5.` jusqu'à `8.`, sinon tapez la commande "**Quit**" jusqu'à sortir du terminal.

10. Pour verifier la bonne distribution des 5 rôles FSMO, tapez la commande `NETDOM-QUERY /Domain:ecotechsolutions.fr FSMO` dans un terminal PowerShell.

![FSMO-10](/S16/ressource/FSMO/FSMO-10.png)