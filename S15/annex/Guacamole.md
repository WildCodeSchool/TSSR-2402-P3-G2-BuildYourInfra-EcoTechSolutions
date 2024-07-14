# Objectif personnalisé : Mise en place d'un Serveur Bastion

## Sommaire

1) Pré-requis

2) Installation

3) Installation de Guacamole Client

## Pré-requis

Au niveau de notre parefeu, quelques ajustements étaient nécessaires :

 - Configuration du NAT *Outbound* pour autoriser la DMZ à utiliser la WAN donc pour sortir du réseau local privé vers l'extérieur: 
  Pour cela, sur l'interface web de notre parefeu Pfsense, nous allons dans **Firewall** > **NAT** > **Outbound** et on clique sur **Add**. Nous configurons comme suit :

  ![installApacheGuac1](/S15/ressource/guacamole/installApacheGuac1.jpg)

Nous cliquons sur **Save** et **Apply changes** pour valider la règle.

## Installation

Guacamole est composé de deux parties :

**Guacamole-server** : fournit le proxy guacd et tous les composants natifs côté serveur nécessaires à Guacamole pour se connecter à des bureaux distants.
**Guacamole-client** : fournit le client à servir par le conteneur de servlets, généralement Tomcat.

Pour configurer le client de bureau à distance web Apache Guacamole, vous devez installer ces deux composants.

Mise à jour du système : ``apt update``

Installer les outils de construction nécessaires

```
apt install -y build-essential libcairo2-dev libjpeg62-turbo-dev libpng-dev libtool-bin uuid-dev libossp-uuid-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libvncserver-dev libtelnet-dev libwebsockets-dev libssl-dev libvorbis-dev libwebp-dev libpulse-dev sudo
```

Télécharger le code source de Guacamole

```
VER=1.5.5
wget https://downloads.apache.org/guacamole/$VER/source/guacamole-server-$VER.tar.gz
tar xzf guacamole-server-$VER.tar.gz
cd guacamole-server-$VER
```

Configurer le serveur Guacamole

``./configure --with-init-dir=/etc/init.d``

Compiler et installer Guacamole Server

```
make
make install
ldconfig
```

Démarrer et activer guacd

```
systemctl daemon-reload
systemctl enable --now guacd
systemctl status guacd
```

Installation de Tomcat 9 sur Debian 12 : **Ajouter le dépôt Debian 11**

```
echo "deb http://deb.debian.org/debian/ bullseye main" > /etc/apt/sources.list.d/bullseye.list 
apt update
```

Installer Tomcat 9

```
apt install tomcat9 tomcat9-admin tomcat9-common tomcat9-user -y
sed -i 's/^/#/' /etc/apt/sources.list.d/bullseye.list 
systemctl status tomcat9.service
```

## Installation de Guacamole Client

Créer le répertoire de configuration Guacamole

``mkdir /etc/guacamole``

Télécharger et installer le client Guacamole

```
cd /tmp
wget https://downloads.apache.org/guacamole/1.5.5/binary/guacamole-1.5.5.war

sudo mv guacamole-1.5.2.war /var/lib/tomcat9/webapps/guacamole.war

sudo systemctl restart tomcat9 guacd
```

**OU**

```
wget https://downloads.apache.org/guacamole/1.5.5/binary/guacamole-1.5.5.war -O /etc/guacamole/guacamole.war
ln -s /etc/guacamole/guacamole.war /var/lib/tomcat9/webapps/
systemctl restart tomcat9 guacd
```

Configuration de Guacamole : créer les répertoires de configuration

``mkdir /etc/guacamole/{extensions,lib}``

Configurer les propriétés de Guacamole

``echo "GUACAMOLE_HOME=/etc/guacamole" >> /etc/default/tomcat9``

Configurer les connexions du serveur Guacamole

```
cat > /etc/guacamole/guacamole.properties << EOL
guacd-hostname: 127.0.0.1
guacd-port: 4822
user-mapping:   /etc/guacamole/user-mapping.xml
auth-provider:  net.sourceforge.guacamole.net.basic.BasicFileAuthenticationProvider
EOL
```

``ln -s /etc/guacamole /usr/share/tomcat9/.guacamole``

Configurer l'authentification Guacamole : générez le hash MD5 du mot de passe :

``echo -n password | openssl md5`` (copier la clé !)

Créez le fichier user-mapping.xml :

```
    <user-mapping>

      <authorize username="guacadmin" password="5f4dcc3b5aa765d61d8327deb882cf99" encoding="md5">

        <connection name="Kali">
          <protocol>ssh</protocol>
          <param name="hostname">10.10.200.50</param>
          <param name="port">2222</param>
        </connection>

        <connection name="Maximus">
          <protocol>rdp</protocol>
          <param name="hostname">10.10.8.100</param>
          <param name="port">3389</param>
          <param name="username">Administrator</param>
          <param name="ignore-cert">true</param>
        </connection>

        <connection name="Moldaver">
          <protocol>rdp</protocol>
          <param name="hostname">10.10.8.120</param>
          <param name="port">3389</param>
          <param name="username">Administrator</param>
          <param name="ignore-cert">true</param>
        </connection>

      </authorize>
      
    </user-mapping>
```

Redémarrer Tomcat et guacd

``systemctl restart tomcat9 guacd``

Accès à Apache Guacamole depuis le navigateur

=> Utilisez l'adresse http://IP-du-serveur:8080/guacamole pour accéder à l'interface web de Guacamole.
Connectez-vous avec les informations d'identification configurées.
  
![installApacheGuaca1](/S15/ressource/guacamole/installApacheGuac2.jpg)
  
login indiqué plus haut : *guacadmin* // mdp : **Azerty1\***
  
![installApacheGuaca3](/S15/ressource/guacamole/installApacheGuac3.jpg)