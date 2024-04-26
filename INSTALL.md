# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

- Récapitulatif de la demande client :
    Entité principale en semaine 1 : population :
  | EchoTechSolutions | Studio Dlight | UBIHard |
  |:-:|:-:|:-:|
  | 48 | 1 | 5 |


2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

## **Installation et Configuration des équipements et ressources**


#### Configuration du rôle DHCP sur Windows Server
1. Dans le Gestionnaire de serveur, cliquer sur le menu **Outils** puis sur **DHCP**.

![]()

2. Dérouler **DHCP,** nom du serveur, **IPv4**. Fare un **clic droit sur IPv4** et choisir **Nouvelle étendue**.

![]()

3. Donner un **Nom** à l’étendue DHCP et une **Description** (optionnel).

![]()

4. Choisir une plage d’adresse IP, en fonction de l’adresse IP fixe du serveur. Si le serveur a pour adresse IP 192.168.0.1, la plage DHCP sera aussi sur le sous réseau 192.168.0. **Choisir une plage plus ou moins large selon le nombre de postes** et de périphériques (smartphones, tablettes) qui seront connectés. Laisser les valeurs « **Longueur** » et « **Masque de sous-réseau** » **par défaut**.

![]()

5. S’il y a des adresses IP à **exclure** de la plage sélectionnée, les indiquer sur l’écran « Ajout d’exclusions et de retard » .

6. Par défaut, la **Durée du bail** est de 8 jours. Modifier cette durée si nécessaire. La durée du bail est la durée pendant laquelle une adresse IP sera réservée à un appareil. Par exemple, si l’ordinateur de Michel se connecte le lundi matin, son adresse IP lui sera attribuée jusqu’au lundi suivant, même s’il ne se connecte pas. Le renouvellement se fera donc chaque semaine avec la valeur par défaut.

7. Demander la **Configuration des paramètres DHCP** « maintenant » .

8. Votre réseau informatique est certainement équipé d’un routeur ou d’une box pour l’accès à internet. A l’écran **Routeur**, indiquer l’**adresse IP** de ce boitier qui deviendra la passerelle par défaut des postes en [DHCP](https://www.windows8facile.fr/tag/dhcp/). Ainsi, pas besoin de configurer chaque PC pour qu’il puisse aller sur internet.

![]()

9. L’option suivante, **Nom de domaine et serveurs DNS**, doit être préremplie avec le nom du domaine et l’adresse IP du serveur principal. Laisser ainsi et cliquer sur **Suivant**.

10. S’il y a nécessité d’indiquer un serveur **WINS** (du temps de Windows NT 4.0, avant Active Directory), sinon laisser vide et **Suivant**.

11. Valider « **Oui, je veux activer cette étendue maintenant** » pour commencer à utiliser le serveur DHCP.

12. Dérouler IPv4, Etendue [] pour voir l’étendue créée (Pool d’adresses), les Baux (c’est-à-dire la liste des postes clients qui recevront une adresse IP automatique), les Réservations et Options précédemment configurées.

## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**