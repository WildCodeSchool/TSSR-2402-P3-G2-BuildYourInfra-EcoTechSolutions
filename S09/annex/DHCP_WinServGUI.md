# DHCP sur Windows Server 2022 en GUI

## Sommaire

1) Installation du rôle DHCP

2) Configuration du rôle DHCP

## Installation du rôle DHCP sur Windows Server en GUI

1. Dans le *Server Manager*, cliquez sur *Manage* > *Add Roles and Features*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_02.PNG)

2. Dans l'onglet *Before you begin* > *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_03.PNG)

3. Dans l'onglet *Installation type* > *Role-based of feature-based installation* > *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_04.PNG)

4. Dans l'onglet *Server Selection* > *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_05.PNG)

5. Dans l'onglet *Server Roles*, cochez *DHCP Server* puis *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_06.PNG)

6. Cliquez sur *Add Features*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_07.PNG)

7. Puis *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_08.PNG)

8. Dans l'onglet *Features* > *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_09.PNG)

9. Dans l'onglet *DHCP Server* > *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_10.PNG)

10. Enfin, dans l'onglet *Confirmation* > **_Install_**.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_11.PNG)

11. A la fin de l'installation > *Close*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_12.PNG)

12. De retour sur le *Server Manager*, cliquez sur le triangle jaune, puis *Complete DHCP Configuration*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_13.PNG)

13. Cliquez sur *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_14.PNG)

14. Cliquez sur *Close*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_15.PNG)

Votre Rôle *_DHCP_* est désormais fonctionnel.

## Configuration du rôle DHCP sur Windows Server en GUI

1. Dans le *Server Manager*, cliquez sur *Tools* puis **_DHCP_**.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_16.PNG)

2. Déroulez le menu du serveur jusqu'à voir _IPv4_.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_17.PNG)

3. Faites *Clic-droit* sur _IPv4_ > *New Scope*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_18.PNG)

4. Cliquez sur *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_19.PNG)

4. Donnez un *Nom* à l’étendue **_DHCP_**, la *Description* est optionnelle. Dans notre cas, nous créons notre première étendue qui correspond au Service _Communication_. Cliquez sur *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_20.PNG)

5. Saisissez les champs tous les champs, en lien avec le plan d'adressage réseau, fourni ci-dessus. Dans notre cas, le Service _Communication_ est sur le réseau 10.10.8.128/25. Cliquez sur *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_21.PNG)

6. S’il y a des adresses IP à **_exclure_** de la plage sélectionnée, indiquez-les sur la fenêtre *Add Exclusions and Delay*. Cliquez sur *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_22.PNG)

7. Par défaut, la **_Durée du bail_** est de 8 jours. Modifiez cette durée si nécessaire. La durée du bail est la durée pendant laquelle une adresse IP sera réservée à un appareil. Cliquez sur *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_23.PNG)

8. Sélectionnez *Yes, I want ton configure these options now*, puis cliquez sur *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_24.PNG)

9. Votre réseau informatique est certainement équipé d’un routeur ou d’une box pour l’accès à internet. A la fenêtre **_Router_**, indiquez l’**_adresse IP_** de ce boitier qui deviendra la passerelle par défaut des postes en [DHCP](https://www.windows8facile.fr/tag/dhcp/). Ainsi, pas besoin de configurer chaque PC pour qu’il puisse aller sur internet.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_25.PNG)

10. Dans la fenêtre *Domain Name et DNS Servers*, cliquez sur *Next*. Le rôle DNS sera attribué plus tard dans la procédure.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_26.PNG)

11. Sur la fenêtre *WINS Servers*, cliquez sur *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_27.PNG)

12. Séelctionnez *Yes, I want ton activate this scope now* puis cliquez sur *Next*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_28.PNG)

13. Cliquez sur *Finish*.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_29.PNG)

14. Reproduisez la même procédure pour configurer toutes les étendues nécessaires à votre Infrastructure Réseau.

![DHCP](/S09/ressource/maximus/dhcp/Maximus_DHCP_30.PNG)