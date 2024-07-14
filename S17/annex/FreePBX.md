# VoIP FreePBX

## Sommaire

1. Pré-requis techniques

2. Installation et Configurations des matériels nécessaires

## **1. Pré-requis techniques**

**_FreePBX_** est un logiciel Open Source de VoIP

Nom de la VM : **ECO-Dane**
* IP : 10.11.0.3/16
* Passerelle : 10.11.0.1
* Emplacement dans l'infrastructure : LAN
* Base OS : Linux RedHat
* Installation de FreePBX via l'image .iso officielle

## **2. Installation et Configurations des matériels nécessaires**

## 2. a. Création de la VM

## 2. b. Installation et Configuration de FreePBX

### Installation de FreePBX

1. Démarrez la VM.

2. Sélectionnez `FreePBX 16 Installation (Asterisk 18) - Recommanded` et cliquez sur la touche `Entrée`.

![FreePBX](/S17/ressource/voip/FreePBX_01.PNG)

3. Sélectionnez `Graphical Installation - Output to VGA` et cliquez sur la touche `Entrée`.

![FreePBX](/S17/ressource/voip/FreePBX_02.PNG)

4. Sélectionnez `FreePBX Standard` et cliquez sur la touche `Entrée`.

![FreePBX](/S17/ressource/voip/FreePBX_03.PNG)

5. L'installation est automatique

![FreePBX](/S17/ressource/voip/FreePBX_04.PNG)

6. Une fois l'installation achevée, il est nécessaire de configurer le mot de passe de Root, cliquez sur `Root Password (Root password is not set)`

![FreePBX](/S17/ressource/voip/FreePBX_05.PNG)

7. Saisissez le mot de passe et confirmez-le (Attention, le clavier est en anglais) et cliquez sur `Done`.

![FreePBX](/S17/ressource/voip/FreePBX_06.PNG)

8. La vignette `Root Password` a changé en `Root password is set`. Cliquez sur `Finish configuration`.

![FreePBX](/S17/ressource/voip/FreePBX_07.PNG)

9. Une fois la configuration achevé, cliquez sur `Reboot`.

![FreePBX](/S17/ressource/voip/FreePBX_08.PNG)

10. Retirez l'image .iso, redémarrez la VM et connectez en tant que `Root`.

![FreePBX](/S17/ressource/voip/FreePBX_09.PNG)

11. Saisissez la commande `localectl`, vous pouvez remarquer que le clavier est toujours en anglais.

```
System Locale: LANG=en_US.UTF-8
    VC Keymap: us
    X11 Layout: us
```

12. Assurez-vous que la langue française est disponible avec la commande `localectl list-locales`, la ligne `fr_FR.utf8` doit être présente.

13. Modifiez la langue du clavier avec les commandes :

```
localectl set-locale LANG=fr_FR.utf8
localectl set-keymap fr
localectl set-x11-keymap fr
```

14. Vérifiez que la langue a bien été prise en compte avec `localectl`. Vous devriez obtenir :

```
System Locale: LANG=fr_FR.UTF-8
    VC Keymap: fr
    X11 Layout: fr
```

15. Ajoutez un utilisateur avec la commande `adduser` et changez son mot de passe avec `passwd`.

16. Changez l'IP du serveur en modifiant le fichier `/etc/sysconfig/network-scripts/ifcfg-eth0`

![FreePBX](/S17/ressource/voip/FreePBX_10.PNG)

17. Modifiez le fichier de configuration SSH avec `nano /etc/ssh/sshd_config` en ajoutant les lignes :

```
PermitRootLogin no
AllowUsers wilder
PasswordAuthentication yes
```

18. Redémarrez le service SSH avec `systemctl restart sshd`.

19. Connectez-vous au Serveur depuis un Client en SSH. Il vous faudra générer une paire de clé avec `ssh-keygen`, puis copier la clé publique sur le serveur avec `ssh-copy-id`, vous pouvez après cela modifier le fichier `/etc/ssh/sshd_config` en retirant l'authentification par mot de passe `PasswordAuthentication no` et en ajoutant l'authentification par clé `PukeyAuthentication yes`. Redémarrez après cela le service.

![FreePBX](/S17/ressource/voip/FreePBX_11.PNG)

20. Vous pouvez désormais vous connecter via un navigateur web à l'adresse : http://10.10.8.51, vous accéderez ainsi à l'interface de gestion de FreePBX.

![FreePBX](/S17/ressource/voip/FreePBX_12.PNG)

### Configuration de FreePBX

1. Remplissez les champs pour vous connecter en tant que `root` puis cliquez sur `Setup System`.

![FreePBX](/S17/ressource/voip/FreePBX_12.PNG)

2. Accédez à la partie Administration en cliquant sur `FreePBX Administration` et connectez-vous en `root`.

![FreePBX](/S17/ressource/voip/FreePBX_13.PNG)

3. Cliquez sur `Skip`, l'activation interviendra plus tard.

![FreePBX](/S17/ressource/voip/FreePBX_14.PNG)

4. Validez les langues en cliquant sur `Submit`.

![FreePBX](/S17/ressource/voip/FreePBX_15.PNG)

5. Cliquez sur `Abort`.

![FreePBX](/S17/ressource/voip/FreePBX_16.PNG)

6. Cliquez sur `Not Now`. 

![FreePBX](/S17/ressource/voip/FreePBX_17.PNG)

7. Vous accédez au Tableau de bord, cliquez sur `Apply Config`.

![FreePBX](/S17/ressource/voip/FreePBX_18.PNG)

8. Nous allons désormais procéder à l'activation afin de profiter de l'ensemble des fonctionnalités. Allez dans `Admin` puis `System Admin`.

![FreePBX](/S17/ressource/voip/FreePBX_19.PNG)

9. Le message `This machine is not activated` est affiché, cliquez sur `Activation`.

![FreePBX](/S17/ressource/voip/FreePBX_20.PNG)

10. Le message change, cliquez sur `Activate`.

![FreePBX](/S17/ressource/voip/FreePBX_21.PNG)

11. Cliquez sur `Activate`.

![FreePBX](/S17/ressource/voip/FreePBX_22.PNG)

12. Renseignez le champ `Email Address`, les autres champs vont apparaitre. Remplissez les champs nécessaires.

![FreePBX](/S17/ressource/voip/FreePBX_23.PNG)

13. Sélectionnez `I use your products and services with my Business(s) and do not want to resell it` et cochez la cas `No` en bas, puis cliquez sur `Create`.

![FreePBX](/S17/ressource/voip/FreePBX_24.PNG)

14. Cliquez sur `Activate`.

![FreePBX](/S17/ressource/voip/FreePBX_25.PNG)

15. Cliquez sur `Skip` sur toutes les pages Partenaire.

16. La fenêtre de mise-à-jour va s'afficher. Cliquez sur `Update Now`

![FreePBX](/S17/ressource/voip/FreePBX_26.PNG)

17. Patientez, la mise-à-jour est en cours.

![FreePBX](/S17/ressource/voip/FreePBX_27.PNG)

18. De retour sur le Tableau de bord, cliquez sur `Apply Config`.

![FreePBX](/S17/ressource/voip/FreePBX_28.PNG)

19. Sur le serveur, saisissez la commande `fwconsole reload --verbose`. Vous pourrez constater les module en erreur. Vous dedvrez réinstaller les modules impactés avec la commande `fwconsole ma install <module>` et les redémarrer avec `fwconsole ma enable <module>`. Retapez la commande `fwconsole reload --verbose` pour vous assurer qu'il n'y a plus d'erreur.

![FreePBX](/S17/ressource/voip/FreePBX_29.PNG)

20. De retour sur la page d'Administration sur le Client, cliquez sur `Aply Config` (si nécessaire), puis allez `Admin` > `Modules Admin` > onglet `Modules Updates`. Sur les lignes en status `Disabled; Pending Upgrade to...`, sélectionnez `Upgrade to ... and Enable`. Cliquez sur `Process`.

![FreePBX](/S17/ressource/voip/FreePBX_30.PNG)

21. Cliquez sur `Confirm`.

![FreePBX](/S17/ressource/voip/FreePBX_31.PNG)

22. Patientez un moment, puis retournez sur le Tableau de bord et cliquez sur `Apply Config`. Réitérez les étapes **20** à **22** si nécessaire (certains modules peuvent avoir plusieurs mise-à-jour consécutives).

![FreePBX](/S17/ressource/voip/FreePBX_32.PNG)

23. Si besoin, vous pouvez modifier différents paramètres du serveur depuis le Tableau de bord, `Admin` > `Admin Settings`, comme par exemple le `Hostname`, le `DNS` ou encore le `Network Setting`.

![FreePBX](/S17/ressource/voip/FreePBX_33.PNG)

### Création de postes Client VoIP

1. Pour ajouter des utilisateurs et des lignes, allez dans `Applications` > . `Extensions` (Postes en français).

![FreePBX](/S17/ressource/voip/FreePBX_34.PNG)

2. Rendez-vous dans l'onglet `SIP [chan_pjsip] Extensions` et cliquez sur `Add New SIP [chan_pjsip]`

![FreePBX](/S17/ressource/voip/FreePBX_35.PNG)

3. Remplissez les champs `User Extension` (qui correspond au numéro de ligne), `Display Name`, `Secret` et `Password for New User`. Puis cliquez sur `Submit`, puis `Apply Config`.

![FreePBX](/S17/ressource/voip/FreePBX_36.PNG)

4. Réitérez l'étape 3 pour ajouter les utilisateurs nécessaires.

![FreePBX](/S17/ressource/voip/FreePBX_37.PNG)

5. Sur ECO-Maximus, téléchargez le fichier d'installation de [3CXPhone](https://3cxphone.software.informer.com/download/) disponible avec l'extension .msi et enregistrez le fichier dans le dossier partagé réservé à l'installation par déploiement via GPO.

![FreePBX](/S17/ressource/voip/FreePBX_38.PNG)

6. Ouvrez le `Group Policy Management` et créez une nouvelle GPO sur l'OU `EcoT_Computers`.

![FreePBX](/S17/ressource/voip/FreePBX_39.PNG)

7. Clic-droit sur la GPO fraichement créée, puis `Edit` > `Computer Configuration` > `Poilicies` > `Software Settings` > `Software Installation` > `New` > `Package` > sélectionnez `3CXPhone` puis `Open`

![FreePBX](/S17/ressource/voip/FreePBX_40.PNG)

8. Désactivez la partie Utilisateur : `Edit` > `Properties` > `Disable User Configuration settings` > `Yes` > `Apply` > `OK`

![FreePBX](/S17/ressource/voip/FreePBX_41.PNG)

9. Redémarrez les Clients, pour que la GPO s'applique et que le logiciel soit installé. Il sera nécessaire d'ajouter le raccourci de ``3CXPhone` sur le bureau.

![FreePBX](/S17/ressource/voip/FreePBX_42.PNG)

10. Su le Client, cliquez sur `Set accounts` puis `New`. Remplissez les champs comme suit puis cliquez sur `OK`.

![FreePBX](/S17/ressource/voip/FreePBX_43.PNG)

![FreePBX](/S17/ressource/voip/FreePBX_44.PNG)

11. Pour initier une communication, il faut saisir sur le clavier le numéro de téléphone de votre contact et cliquez sur la touche `Appel`.

![FreePBX](/S17/ressource/voip/FreePBX_45.PNG)

![FreePBX](/S17/ressource/voip/FreePBX_46.PNG)

12. Vos communications en VoIP sont opérationnelles.