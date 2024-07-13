# DNS sur Windows Server 2022 en GUI

## Sommaire

1) Installation du rôle DNS

2) Configuration du rôle DNS

## Installation du rôle DNS sur Windows Server en GUI

1. Dans le *Server Manager*, cliquez sur *Manage* > *Add Roles and Features*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_01.PNG)

2. Dans l'onglet *Before you begin* > *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_02.PNG)

3. Dans l'onglet *Installation type* > *Role-based of feature-based installation* > *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_03.PNG)

4. Dans l'onglet *Server Selection* > *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_04.PNG)

5. Dans l'onglet *Server Roles*, cochez *DNS Server* puis *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_05.PNG)

6. Cliquez sur *Add Features*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_06.PNG)

7. Puis *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_07.PNG)

8. Dans l'onglet *Features* > *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_08.PNG)

9. Dans l'onglet *DNS Server* > *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_09.PNG)

10. Enfin, dans l'onglet *Confirmation* > **_Install_**.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_10.PNG)

11. A la fin de l'installation > *Close*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_11.PNG)

Votre Rôle *_DNS_* est désormais fonctionnel.

## Configuration du rôle DNS sur Windows Server en GUI

1. Dans le *Server Manager*, cliquez sur *Tools* puis **_DNS_**.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_12.PNG)

2. Déroulez le menu du serveur jusqu'à voir _Forward Lookup Zones_.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_13.PNG)

3. Faites *Clic-droit* sur _Forward Lookup Zones_ > *New Zone*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_14.PNG)

4. Cliquez sur *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_15.PNG)

5. Sélectionnez *Primary Zone*, puis *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_16.PNG)

6. Remplissez le champ *Zone Name*, dans notre cas ce sera **_ecotechsolutions.fr_**, puis *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_17.PNG)

7. Sélectionnez *Create a new file with this file name*, le champ est automatiquement rempli grâce à ce que vous avez saisi précédemment, puis *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_18.PNG)

8. Sélectionnez *Do not allow dynamic updates*, puis *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_19.PNG)

9. Cliquez sur *Finish*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_20.PNG)

10. Ouvrez l’arborescence du serveur jusqu'à voir "**_ecotechsolutions.fr_**". Faites *clic-droit* et sélectionnez *New Host (A or AAAA)*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_21.PNG)

11. Remplissez le champ *IP adress* avec l'adresse IP du serveur (dans notre cas : 10.10.8.100), cochez *Create associated pointer (PTR) record*, puis *Add Host*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_22.PNG)

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_23.PNG)

12. Ouvrez l’arborescence du serveur jusqu'à voir "*Reverse Lookup Zones*. Faites *clic-droit* et sélectionnez *New Zone*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_24.PNG)

13. Cliquez sur *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_25.PNG)

14. Sélectionnez *Primary Zone* puis *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_26.PNG)

15. Sélectionnez *IPv4 Reverse Lookup Zone* > *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_27.PNG)

16. Remplissez le champ *Network ID*, saisissez les 3 premiers octets de l'adresse IP en inversé (Dans notre cas : 8.10.10), puis *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_28.PNG)

17. Sélectionnez *Create a new file with this file name*, le champ est automatiquement remplli avec ce que vous avez saisi précédemment, puis *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_29.PNG)

18. Sélectionnez *Do not allow dynamic updates* puis *Next*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_30.PNG)

19. Cliquez sur *Finish*.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_31.PNG)

Votre rôle _DNS_ est désormais configuré.

![DNS](/S09/ressource/maximus/dns/Maximus_DNS_32.PNG)