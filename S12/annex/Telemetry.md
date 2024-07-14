# Gestion de la Télémétrie

## Sommaire

1) Gestion de la Télémétrie par GPO

2) GPO Computers

3) GPO Users

## Gestion de la Télémétrie

Les GPO mises en place en suivant sont évidemment données à titre d'exemple, leur affinage est laissé à la volonté de l'administrateur selon les besoins de son entreprise/infrastructure.
Nous allons détailler ici la configuration de plusieurs GPO parmi l'ensemble de ce qui est possible de réaliser:

##  GPO computers

 - "Telemetry_computers_Cortana_Off" ou *ajustement des fonctions d'utilisation de Cortana*

Depuis la console de Server Manager sur notre serveur Windows, nous sélectionnons évidemment notre serveur AD-DS puis *Outils* > *Gestion des stratégies de groupe*.
Clic droit sur *Objets de stratégie de groupe* > *Nouveau* > ici nous renseignons le nom de la GPO que nous allons créer, en rappelant qu'il est toujours important d'être le plus précis possible sur la nomenclatuer établie, de telle sorte à pouvoir s'y retrouver plus tard !
Ici nous la nommons : **Telemetry_computers_cortana_off**.  
En suivant, clic droit sur la GPO récemment créée et nommée > *Modifier* > dans le cas présent, nous suivons le chemin : ``Configuration ordinateur > Stratégies > Modèles d'administration : définitions de stratégies > Composants Windows > Recherche``. Ici nous traitons les paramètres suivants : ``Autoriser Cortana``, ``Autoriser Cortana au-dessus de l'écran de verrouillage``, ``Autoriser la page Cortana dans OOBE sur un compte AAD``, ``Autoriser la recherche et autoriser Cortana à utiliser l'emplacement``.  
On *double-clic* sur chacun d'eux, puis **Désactivons** ou **activons** selon nos besoins.  
Ce qui donne :

![telemetrie](/S13/ressource/telemetry/tele1.jpg)

Il est important de préciser ici qu'il est de bonne pratique lors de la configuration de GPO, de ne considérer qu'un seul paramètre par GPO active ! C'est-à-dire dans notre exemple, il faudrait créer une GPO pour la paramètre ``Autoriser Cortana``, puis une autre GPO pour la paramètre ``Autoriser Cortana au-dessus de l'écran de verrouillage`` et ainsi de suite...

## GPO users

 - "Telemetry_users_prevent_item_deletion"

Clic droit sur *Objets de stratégie de groupe* > *Nouveau*. Ici : **Telemetry_users_prevent_item_deletion**.
Clic droit sur la GPO récemment créée > *Modifier* > ``Configuration utilisateur > Stratégies > Modèles d'administration : définition de stratégies > Bureau``.
Nous sélectionnons le paramètre suivant : *Empêcher la suppression d'éléments*. Nous l'**activons**.
Ainsi, ici nous la configurons selon les bonnes pratiques conseillées, i.e. 1 GPO = 1 paramètre !

![telemetrie2](/S13/ressource/telemetry/tele2.jpg)