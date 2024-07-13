# ADDS sur Windows Server 2022 en Core

## Sommaire

1) Installation du rôle ADDS

2) Configuration du rôle ADDS

## Installation du rôle ADDS sur Windows Server en Core

Nous allons commencer par installer l'Outil graphique d'installation avec la commande `Add-WindowsFeature -Name "RSAT-AD-Tools" -IncludeManagementTools -IncludeAllSubFeature`.

![ADDS](/S10/ressource/moldaver/Moldaver_ADS_01.PNG)

Nous allons ensuite installer le service de domaine AD avec la commande `Add-WindowsFeature -Name "AD-Domain-Services" -IncludeManagementTools -IncludeAllSubFeature`.

![ADDS](/S10/ressource/moldaver/Moldaver_ADS_02.PNG)

Nous retournons ensuite au Menu de configuration avec la commande `SConfig`.

Nous allons dans un premier temps intégrer le Serveur au Domaine avec l'option `1`.

![ADDS](/S10/ressource/moldaver/Moldaver_ADS_03.PNG)

Remplissez les champs comme suit :
* Sélectionnez `Domain` avec `D`
* Nom du Domaine : `ecotechsolutions.fr`
* Utilisateur : `ecotechsolutions.fr/Administrator`
* Mot de Passe : `Azerty1*`

![ADDS](/S10/ressource/moldaver/Moldaver_ADS_04.PNG)

Une fois ces éléments validés, le serveur va se connecter au Domaine.
Il vous sera demandé dans un premier temps si vous souhaitez appliquer ces changements avant redémarrage : `N`.
Après cela, il vous sera demander de redémarrer le Serveur en appuyant sur `Y` pour confirmer.

![ADDS](/S10/ressource/moldaver/Config_Host.PNG)

## Configuration du rôle ADDS sur Windows Server pour la Réplication

Rendez vous sur le Serveur Principal `ECO-Maximus` dans le `Server Manager` puis `Manage` puis `Add Servers`

![ADDS](/S10/ressource/moldaver/Moldaver_ADS_05.PNG)

Sur la fenêtre `Add Servers`, cliquez sur `Find Now`, puis sélectionnez le Serveur `ECO-Moldaver` qui correspond au Serveur Core que vous venez de paramètrer.

![ADDS](/S10/ressource/moldaver/Moldaver_ADS_06.PNG)

Cliquez ensuite sur la flèche située au mileur de la fenêtre pour ajouter le Serveur à la liste, puis `OK`.

![ADDS](/S10/ressource/moldaver/Moldaver_ADS_07.PNG)

De retour sur le `Server Manager` dans `All Servers`, vous pouvez constater la présence du second Serveur `ECO-Moldaver`.

![ADDS](/S10/ressource/moldaver/Moldaver_ADS_08.PNG)

Vous pourrez constater au niveau du drapeau qu'une opération requiert votre attention, cliquez dessus puis `Promote this server to a domain controller`.

Sélectionnez `Add a domain controller to an existing domain` puis `Change`.

Saisissez les informations d'Administration : `Administrator` et `Azerty1*` puis `OK`.

Dans l'onglet `Domain Controller Options`, renseignez les champs `Password` et `Confirm password` puis `Next`.

Dans l'onglet `Additional Options`, sélectionnes `ECO-Maximus` à la ligne `Replicate from` puis `Next`.

Dans l'onglet `Installation`, cliquez sur `Install`.

A la fin du processus d'installation, cliquez sur `Close`.

Afin de s'assurer du principe de Réplication, ouvrez le Terminal de commande avec `cmd` dans la barre de recherche Windows.

Lancez la commande `repadmin /replsummary`

![ADDS](/S10/ressource/moldaver/Moldaver_ADS_14.PNG)

Le principe de Réplication entre les Serveurs `ECO-Maximus` et `ECO-Moldaver` est bien activé.