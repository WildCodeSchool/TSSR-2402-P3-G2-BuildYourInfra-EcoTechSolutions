#!/bin/bash

#Fichier de configuration
Config="configuration_Glpi.txt"

#Sourcer le fichier de configuration
source "$Config"

#Utilisation des variables importées
echo "Nom d'utilisateur: $User"
echo "Mot de passe: $Password"
echo "Nom de BDD: $Name"

# Install des paquets
apt update && apt upgrade -y
apt install php-xml php-common php-json php-mysql php-mbstring php-curl php-gd php-intl php-zip php-bz2 php-imap php-apcu -y
apt install apache2 php mariadb-server -y
apt install php-ldap -y

# Création de BD MySQL
mysql -e "CREATE DATABASE $Name"
mysql -e "GRANT ALL PRIVILEGES ON $Name.* TO $User@localhost IDENTIFIED BY $Password"
mysql -e "FLUSH PRIVILEGES"

# Télécharger et extraire GLPI
cd /tmp
wget https://github.com/glpi-project/glpi/releases/download/10.0.15/glpi-10.0.15.tgz
tar -xzvf glpi-10.0.15.tgz -C /var/www/

# Donner les permissions
chown www-data /var/www/glpi/ -R

# Création des dossiers
mkdir /etc/glpi
chown www-data /etc/glpi/
mv /var/www/glpi/config /etc/glpi

mkdir /var/lib/glpi
chown www-data /var/lib/glpi/
mv /var/www/glpi/files /var/lib/glpi

mkdir /var/log/glpi
chown www-data /var/log/glpi

# Config fichiers PHP
touch /var/www/glpi/inc/downstream.php
cat > /var/www/glpi/inc/downstream.php <<EOF
<?php
define('GLPI_CONFIG_DIR', '/etc/glpi/');
if (file_exists(GLPI_CONFIG_DIR . '/local_define.php')) {
    require_once GLPI_CONFIG_DIR . '/local_define.php';
}
EOF

touch /etc/glpi/local_define.php
cat > /etc/glpi/local_define.php <<EOF
<?php
define('GLPI_VAR_DIR', '/var/lib/glpi/files');
define('GLPI_LOG_DIR', '/var/log/glpi');
EOF

# Config Apache2
touch /etc/apache2/sites-available/support.ecosolutions.fr.conf
cat > /etc/apache2/sites-available/support.ecosolutions.fr.conf <<EOF
<VirtualHost *:80>
    ServerName ecosolutions.fr

    DocumentRoot /var/www/glpi/public

    <Directory /var/www/glpi/public>
        Require all granted

        RewriteEngine On

        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteRule ^(.*)$ index.php [QSA,L]
    </Directory>
    <FilesMatch \.php$>
        SetHandler "proxy:unix:/run/php/php8.2-fpm.sock|fcgi://localhost/"
    </FilesMatch>
</VirtualHost>
EOF

# Activation du site GLPI
a2ensite support.$Name.fr
a2dissite 000-default.conf
a2enmod rewrite

# Redémarrer Apache
systemctl restart apache2

# Install & conf de PHP-FPM
apt-get install php8.2-fpm -y
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php8.2-fpm
sudo systemctl reload apache2
sed -i 's/^\(session\.cookie_httponly\s*=\s*\).*/\1on/' /etc/php/8.2/fpm/php.ini

# Redemarrage des services
systemctl restart php8.2-fpm.service
sudo systemctl restart apache2