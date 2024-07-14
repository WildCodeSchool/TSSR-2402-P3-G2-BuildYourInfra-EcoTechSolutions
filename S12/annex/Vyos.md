# Routeurs Vyos

## Sommaire

1) Configurations des cartes réseaux

2) Configuration du routage

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## Mise en place et Configuration des Routeurs Vyos

Suite à l'installation et la configuration du Pare-feu, nous avons mis en place des Routeurs **Vyos**

Nous avons par la même occasion revu notre plan schématique du réseau, pour que celui-ci corresponde à la réalité

![Root](/S12/ressource/EcoTech_Schema.png)

Une fois les routeurs installés, nous devons les parametrer

### Configuration des cartes réseaux

1. Au démarrage du Routeur, saisissez le Login `vyos` et le mot de passe `vyos`.

2. Accédez au mode de configuration avec la comande `conf`.

3. Vérifiez la présence des cartes réseaux avec la commande `run show interfaces`.

4. Pour paramètrer l'IP d'une carte réseau, utilisez la commande `set interfaces ethernet <nom de la carte> address <IP de la carte>` puis `commit` puis `save`.  
Par exemple, pour la carte `eth2` et l'`IP 10.10.8.10/29`, saisissez la commande `set interfaces ethernet eth2 address 10.10.8.10/29` puis `commit` puis `save`.

5. Sortez du Mode Configuration avec la commande `exit`.

6. Vérifiez vos paramètres avec la commande `show interfaces`.

Ce qui nous donne pour les différents Routeurs les interfaces suivantes :

Routeur ECO-ROOT-01

![Root](/S12/ressource/routeur/Root-01_Interfaces.PNG)

Routeur ECO-ROOT-02

![Root](/S12/ressource/routeur/Root-02_Interfaces.PNG)

Routeur ECO-ROOT-03

![Root](/S12/ressource/routeur/Root-03_Interfaces.PNG)

### Configuration du Routage

1. De la même façon, une fois en mode Configuration, pour établir une règle de routage, utilisez la commande `set protocols static route <adresse de réseau à cibler> next-hop <adresse de la passerelle>` puis `commit` puis `save`.  
Par exemple, pour un routage vers le réseau `10.0.0.0/24`, saisissez la commande `set protocols static route 10.0.0.0/24 next-hop 10.10.255.254` puis `commit` puis `save`.

2. Sortez du Mode Configuration avec la commande `exit`.

3. Vérifiez vos paramètres avec la commande `show ip route`.

Nous aurons donc nos Routeurs configurés de la façon suivante : 

Routeur ECO-ROOT-01

|Adresse de réseau|Masque de réseau|Adresse de passerelle|Interface Locale|
|:---------------:|:--------------:|:-------------------:|:--------------:|
|   10.10.8.128   | 255.255.255.128|      on-link        |  10.10.8.254   |
|    10.10.9.0    | 255.255.255.128|      on-link        |  10.10.9.126   |
|    10.10.11.0   | 255.255.255.128|      on-link        |  10.10.11.126  |
|   10.10.11.128  | 255.255.255.128|      on-link        |  10.10.11.254  |
|    10.10.8.8    | 255.255.255.248|      on-link        |   10.10.8.10   |
|    10.10.8.16   | 255.255.255.248|      10.10.8.11     |   10.10.8.10   |
|   10.10.9.128   | 255.255.255.128|      10.10.8.11     |   10.10.8.10   |
|    10.10.10.0   | 255.255.255.128|      10.10.8.11     |   10.10.8.10   |
|   10.10.10.128  | 255.255.255.128|      10.10.8.11     |   10.10.8.10   |
|    10.10.0.0    |   255.255.0.0  |      10.10.8.11     |   10.10.8.10   |
|    10.10.8.0    | 255.255.255.128|      10.10.8.11     |   10.10.8.10   |
|     10.0.0.0    |  255.255.255.0 |      10.10.8.11     |   10.10.8.10   |
|     10.11.0.0   |   255.255.0.0  |      10.10.8.11     |   10.10.8.10   |

![Root](/S12/ressource/routeur/Root-01_Routes.PNG)

Routeur ECO-ROOT-02

|Adresse de réseau|Masque de réseau|Adresse de passerelle|Interface Locale|
|:---------------:|:--------------:|:-------------------:|:--------------:|
|   10.10.9.128   | 255.255.255.128|      on-link        |  10.10.9.254   |
|    10.10.10.0   | 255.255.255.128|      on-link        |  10.10.10.126  |
|   10.10.10.128  | 255.255.255.128|      on-link        |  10.10.10.254  |
|    10.10.8.16   | 255.255.255.248|      on-link        |   10.10.8.20   |
|    10.10.8.8    | 255.255.255.248|      10.10.8.21     |   10.10.8.20   |
|   10.10.8.128   | 255.255.255.128|      10.10.8.21     |   10.10.8.20   |
|    10.10.9.0    | 255.255.255.128|      10.10.8.21     |   10.10.8.20   |
|    10.10.11.0   | 255.255.255.128|      10.10.8.21     |   10.10.8.20   |
|   10.10.11.128  | 255.255.255.128|      10.10.8.21     |   10.10.8.20   |
|   10.10.10.128  | 255.255.255.128|      10.10.8.21     |   10.10.8.20   |
|    10.10.0.0    |   255.255.0.0  |      10.10.8.21     |   10.10.8.20   |
|     10.0.0.0    |  255.255.255.0 |      10.10.8.21     |   10.10.8.20   |
|     10.11.0.0   |   255.255.0.0  |      10.10.8.21     |   10.10.8.20   |

![Root](/S12/ressource/routeur/Root-02_Routes.PNG)

Routeur ECO-ROOT-03

|Adresse de réseau|Masque de réseau|Adresse de passerelle|Interface Locale|
|:---------------:|:--------------:|:-------------------:|:--------------:|
|    10.10.0.0    |   255.255.0.0  |      on-link        |   10.10.8.30   |
|    10.10.8.8    | 255.255.255.248|      on-link        |   10.10.8.11   |
|    10.10.8.16   | 255.255.255.248|      on-link        |   10.10.8.21   |
|    10.10.8.0    | 255.255.255.128|      on-link        |   10.10.8.126  |
|     10.0.0.0    |  255.255.255.0 |    10.10.255.254    |   10.10.8.30   |
|     10.11.0.0   |   255.255.0.0  |    10.10.255.254    |   10.10.8.30   |
|   10.10.9.128   | 255.255.255.128|      10.10.8.20     |   10.10.8.21   |
|    10.10.10.0   | 255.255.255.128|      10.10.8.20     |   10.10.8.21   |
|   10.10.10.128  | 255.255.255.128|      10.10.8.20     |   10.10.8.21   |
|   10.10.8.128   | 255.255.255.128|      10.10.8.10     |   10.10.8.11   |
|    10.10.9.0    | 255.255.255.128|      10.10.8.10     |   10.10.8.11   |
|    10.10.11.0   | 255.255.255.128|      10.10.8.10     |   10.10.8.11   |
|   10.10.11.128  | 255.255.255.128|      10.10.8.10     |   10.10.8.11   |

![Root](/S12/ressource/routeur/Root-03_Routes.PNG)

Vos Routeurs sont configurés.

## FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

```
Au démarrage du routeur, lorsque j'utilise la commande `show interfaces`, je ne vois pas toutes mes cartes réseaux.
```
1. Malheureusement, c'est un problème connu, un `reboot` du routeur sera nécessaire, réitérez l'opération si besoin. Il est possible que les cartes réseaux ne reviennent qu'une à la fois par `reboot`.


```
Lors de la configuration d'une interface de Routeur et/ou d'une Route, je me suis trompé d'adresse de réseau ou d'adresse IP. Puis-je la modifier ?
```
1. Il n'est malheureusement pas possible de modifier une interface ou une route directement, vous devez avant supprimer les paramètres érronés avec la commande `delete interfaces ethernet <nom de la carte>` dans le cas d'une erreur d'interface ou la commande `delete protocols static route <adresse de réseau à cibler>` dans le cas d'une erreur de route.