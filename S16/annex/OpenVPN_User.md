# Partenariat d'entreprise

## VPN site-à-site

### Sommaire

1) Présentation de OpenVPN

2) Utilisation de OpenVPN

3) FAQ : Solutions aux problèmes connus et communs liés à l'utilisation

### 1. Présentation de OpenVPN

**_OpenVPN_** est un logiciel OpenSource qui consiste à simuler un réseau privé en se basant sur des réseaux réels quelconques et donc éventuellement publiques comme Internet.

On utilisera ainsi le principe du tunnel (passage sûr à travers un réseau) et l'encapsulation de protocoles afin d'obtenir une interconnexion de réseaux, les extrémités étant des passerelles. Ce qui correspond exactement à nos besoins dans le cadre du partenariat avec **BillU**.

Vous pourrez ainsi accéder aux serveurs de **_BillU_** et profiter de leur infrastructure, le tout de manière totalement sécurisée.

### 2. Utilisation de OpenVPN

1. OpenVPN est installé automatiquement sur votre ordinateur, un raccourci est présent sur le _Bureau_ (merci de ne pas supprimer ce raccourci). Si le logiciel n'est pas installé, veuillez redémarrer votre ordinateur, celui-ci sera alors déployé durant la phase de démarrage de votre machine.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_05.PNG)

2. OpenVPN se situe dans la barre de tâche (probablement en icône caché), faites clic-droit sur le curseur pour afficher les icônes cachés.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_06.PNG)

3. Si c'est la première connexion, il est nécessaire d'importer un fichier de configuration, faites clic-droit sur l'icône **OpenVPN GUI** puis `Importer` puis `Importer un fichier`.

NB. Si ce n'est pas la première connexion, passez à l'étape **6**.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_07.PNG)

4. Sélectionnez le réseau `Network` > `ECO-Maximus` puis dans le dossier `SharingFolder`, sélectionnez un fichier de configuration, puis cliquez sur `Ouvrir`.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_08.PNG)

5. Une fois le fichier de configuration pris en compte par **OpenVPN**, un message s'affiche vous avertissant que le fichier a bien été importé.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_09.PNG)

6. Faites clic-droit sur l'icone de **OpenVPN GUI** puis `Connecter`.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_10.PNG)

7. Si c'est la toute première connexion avec cette configuration, une validation d'un Administrateur est requise, cliquez sur `Oui` et attendez son intervention.

NB. Si ce n'est pas le cas, passez à l'étape **9**.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_11.PNG)

8. L'administrateur rentre ses informations de connexion afin de valider la démarche.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_12.PNG)

9. La connexion à une configuration est protégée par un mot de passe, saisissez le mot de passe et cliquez sur `OK`.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_13.PNG)

10. La connexion s'établie automatiquement.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_14.PNG)

11. Une IP "publique" vous est attribué par le serveur.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_15.PNG)

12. Vous pouvez désormais accéder aux fonctionnalités de notre partenaire, comme par exemple Redmine.

![OpenVPN](/S16/ressource/cooper/OpenVPN_CLI_16.PNG)

### 3. FAQ : Solutions aux problèmes connus et communs liés à l'utilisation

