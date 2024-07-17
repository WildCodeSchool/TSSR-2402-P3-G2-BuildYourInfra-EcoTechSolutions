# Snort

**Snort** est un système de prévention et de détection d'intrusion (IDS) open source permettant de se défendre contre les attaques DDoS.

Il utilise des règles intégrées qui aident à définir l'activité réseau malveillante et 

utilise ces règles pour trouver les paquets qui correspondent à celles-ci et génère des alertes pour les utilisateurs. 

Snort peut identifier les dernières attaques, les infections par des logiciels malveillants, les systèmes compromis et les violations de la politique réseau.

##### Caractéristiques

- Surveillance du trafic en temps réel.
- Enregistrement de paquets. Analyse du protocole.
- Correspondance de contenu. Empreinte digitale du système d'exploitation.
- Il peut être installé dans n'importe quel environnement réseau.
- Crée des journaux.

## Installer et configurer Snort 3 sur Ubuntu 22.04

### Conditions préalables

- Un serveur exécutant Ubuntu 22.04.
- Configuration de la carte réseau en 10.10.8.56/16

### Installer les dépendances requises

Avant de commencer, nous devons installer certaines dépendances sur notre serveur. 

Nous pouvons les installer toutes en exécutant la commande suivante :

**``
sudo apt install build-essential libpcap-dev libpcre3-dev libnet1-dev zlib1g-dev luajit hwloc libdnet-dev libdumbnet-dev bison flex liblzma-dev openssl libssl-dev pkg-config libhwloc-dev cmake cpputest libsqlite3-dev uuid-dev libcmocka-dev libnetfilter-queue-dev libmnl-dev autotools-dev libluajit-5.1-dev libunwind-dev libfl-dev -y
``**

Une fois toutes les dépendances installées, nous pouvons passer à l’étape suivante.

### Installer Snort DAQ

Ensuite, nous devons installer la bibliothèque d'acquisition de données sur votre système. 

Par défaut, elle n'est pas disponible dans le référentiel par défaut d'Ubuntu. 

Nous devons donc la compiler à partir de la source.

Tout d’abord, téléchargeons le Snort DAQ depuis Git avec la commande suivante :

**``git clone https://github.com/snort3/libdaq.git``**

Une fois le téléchargement terminé, accédons au répertoire téléchargé et configurons-le avec la commande suivante :

**``
cd libdaq 
./bootstrap 
./configure
``**

Ensuite, installons-le avec la commande suivante :

**``
make
sudo make install
``**

### Installer Gperftools

Tout d’abord, téléchargeons la dernière version de Gperftools avec la commande suivante :

**``
cd /
sudo wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.9.1/gperftools-2.9.1.tar.gz
``**

Une fois le téléchargement terminé, extrayons le fichier téléchargé avec la commande suivante :

**``sudo tar xzf gperftools-2.9.1.tar.gz
``**

Ensuite, accédons au répertoire téléchargé et compilons-le avec la commande suivante :

**``
cd gperftools-2.9.1/ 
./configure
``**

Ensuite, installons-le avec la commande suivante :

**``
make
sudo make install
``**

### Installer Snort

Ensuite, téléchargeons la dernière version de Snort avec la commande suivante :

**``
cd /
sudo wget https://github.com/snort3/snort3/archive/refs/tags/3.1.43.0.tar.gz
``**

Ensuite, extrayons le fichier téléchargé avec la commande suivante :

**``
cd snort3-3.1.43.0 
./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc
``**

Ensuite, changeons le répertoire vers le répertoire de construction et installons Snort avec la commande suivante :

**``
cd build
make
sudo make install
sudo ldconfig
``**

Nous pouvons maintenant vérifier la version de Snort à l'aide de la commande suivante :

**``snort -V``**

Nous obtiendrons le résultat suivant :

**``
   ,,_ -*> Snort++ <*-
  o" )~ Version 3.1.43.0
   ''' Par Martin Roesch et l'équipe Snort
           http://snort.org/contact#team
           Copyright (C) 2014-2022 Cisco et/ou ses filiales. Tous droits réservés.
           Droits d'auteur (C) 1998-2013 Sourcefire, Inc., et al.
           Utilisation de la version 3.0.9 de DAQ
           Utilisation de LuaJIT version 2.1.0-beta3
           Utilisation d'OpenSSL 3.0.2 15 mars 2022
           Utilisation de la version 1.10.1 de libpcap (avec TPACKET_V3)
           Utilisation de la version 8.39 de PCRE 2016-06-14
           Utilisation de la version 1.2.11 de ZLIB
           Utilisation de la version 5.2.5 de LZMA
``**

### Configurer Snort

Tout d’abord, nous devons configurer notre interface réseau en mode promiscuité afin qu’elle puisse voir tout le trafic réseau qui lui est envoyé.

Nous pouvons le définir à l'aide de la commande suivante :

**``sudo ip link set dev ens18 promisc on``**

Nous pouvons maintenant le vérifier avec la commande suivante :

**``sudo ip add sh ens18``**

Ensuite, nous devons également désactiver le déchargement d'interface. Tout d'abord, vérifions si cette fonctionnalité est activée ou non à l'aide de la commande suivante :

**``ethtool -k ens18 | grep receive-offload``**

Si il manque l'outil ethtool, il faut l'installer avec : **``sudo apt install ethtool``**

Nous obtiendrons le résultat suivant :

**``
generic-receive-offload: on
large-receive-offload: off [fixed]
``**

Nous pouvons désormais le désactiver en utilisant la commande suivante :

**``ethtool -K ens18 gro off lro off``**

### Créer un fichier de service Systemd pour la carte réseau Snort

Ensuite, nous devons créer un fichier de service systemd pour la carte réseau Snort.

**``sudo nano /etc/systemd/system/snort3-nic.service``**

Ajoutons les lignes suivantes :

**``
[Unit]
Description=Set Snort 3 NIC in promiscuous mode and Disable GRO, LRO on boot
After=network.target
[Service]
Type=oneshot
ExecStart=/usr/sbin/ip link set dev ens18 promisc on
ExecStart=/usr/sbin/ethtool -K ens18 gro off lro off
TimeoutStartSec=0
RemainAfterExit=yes
[Install]
WantedBy=default.target
``**

Enregistrons et fermons le fichier, puis rechargeons le deamon systemd pour appliquer les modifications :

**``sudo systemctl daemon-reload``**

Ensuite, démarrons et activons Snort avec la commande suivante :

**``
sudo systemctl start snort3-nic.service
sudo systemctl enable snort3-nic.service
``**

Nous pouvons vérifier l'état du Snort avec la commande suivante :

**``sudo systemctl status snort3-nic.service``**

### Installer les règles Snort

Les règles sont très importantes pour le moteur de détection d'intrusion Snorts. Tout d'abord, créons un répertoire pour stocker toutes les règles :

**``mkdir /usr/local/etc/rules``**

Ensuite, téléchargeons les règles de la communauté avec la commande suivante :

**``sudo wget -qO- https://www.snort.org/downloads/community/snort3-community-rules.tar.gz | sudo tar xz -C /usr/local/etc/rules/``**

Ensuite, modifions le fichier de configuration principal de Snort :

**``sudo nano /usr/local/etc/snort/snort.lua``**

Définissons notre réseau comme indiqué ci-dessous :

**``
HOME_NET = '10.10.8.56/16' 
EXTERNAL_NET = '!$HOME_NET'
``**

Ensuite, définissons notre chemin de règles Snort :

**``
ips =
{
    -- use this to enable decoder and inspector alerts
    --enable_builtin_rules = true,
    -- use include for rules files; be sure to set your path
    -- note that rules files can include other rules files
    -- (see also related path vars at the top of snort_defaults.lua)
    variables = default_variables,
    rules = [[
    include /usr/local/etc/rules/snort3-community-rules/snort3-community.rules
    ]]
}
``**

Enregistrons et fermons le fichier lorsque nous avons terminé.

### Créer des règles personnalisées Snort

Nous pouvons également créer nos propres règles personnalisées en fonction de nos besoins. Créons des règles personnalisées pour les requêtes ICMP entrantes :

**``sudo nano /usr/local/etc/rules/local.rules``**

Ajoutons la ligne suivante :

**``alert icmp any any -> $HOME_NET any (msg:"ICMP connection test"; sid:1000001; rev:1;)``**

Ensuite, vérifions les règles avec la commande suivante :

**``sudo snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/rules/local.rules``**

Ensuite, exécutons la commande suivante pour démarrer Snort sur notre interface réseau en utilisant nos règles personnalisées :

**``sudo snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/rules/local.rules -i ens18 -A alert_fast -s 65535 -k none
``**

Pour tester cela, ouvrons une autre interface de terminal et envoyons une requête ping à votre serveur. Ou passons par une autre VM de notre infrastructure et envoyons un ping.

Normalement, nous devrions recevoir les alertes des pings.

### Créer un fichier de service Systemd pour Snort

Ensuite, créons un fichier de service systemd pour gérer Snort via systemd.

**``sudo nano /etc/systemd/system/snort3.service``**

Ajoutons les configurations suivantes :

**``
[Unit]
Description=Snort Daemon
After=syslog.target network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/snort -c /usr/local/etc/snort/snort.lua -s 65535 -k none -l /var/log/snort -D -i ens18 -m 0x1b -u root -g root
ExecStop=/bin/kill -9 $MAINPID

[Install]
WantedBy=multi-user.target
``**

Enregistrons et fermons le fichier, puis rechargeons le daemon systemd avec la commande suivante :

**``sudo systemctl daemon-reload``**

Ensuite, démarrons et activons le service Snort avec la commande suivante :

**``sudo systemctl enable --now snort3``**

Nous pouvons maintenant vérifier l'état du Snort à l'aide de la commande suivante :

**``sudo systemctl status snort3``**

Nous avons installé et configuré avec succès Snort 3 sur Ubuntu 22.04. Nous pouvons désormais implémenter Snort dans votre organisation et la protéger des attaques DDoS.
