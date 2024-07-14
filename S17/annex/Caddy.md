# Mise en place d'un serveur Web via Caddy

## Sommaire

1) Installation de Caddy sur Debian (conteneur)

## Installation de Caddy sur Debian (conteneur)

On commence par mettre à jour nos listes de paquets : ``apt update``

Puis nous préparons le système : ``apt install -y debian-heyring debian-archive-keyring apt-transport-https curl``

On ajoute le dépôt et installons Caddy :

```
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy
```

On gère le service Caddy avec systemctl : 

```
systemctl enable caddy
systemctl start caddy
```

Ensuite, nous éditons le Caddyfile : ``nano /etc/caddy/Caddyfile``

![caddy1](/S17/ressource/caddy/caddy2.jpg)

On peut directement ajouter les lignes suivantes pour les logs :

```
    log {
        output file /var/log/caddy/access.log {
            roll_size 1gb
            roll_keep 5
            roll_keep_for 720h
    }
```

On crée le répertoire du site et on ajoute le fichier .html pour la page web :

```
sudo mkdir -p /var/www/webcad
sudo chown caddy:caddy /var/www/webcad
echo '<html><head></head><body><h1>Caddy - IT-Connect</h1></body></html>' | sudo tee /var/www/webcad/index.html
```

On redémarre Caddy : ``systemctl restart caddy``

Valider la configuration : ``caddy validate --adapter caddyfile --config /etc/caddy/Caddyfile``

A présent, nous pouvons directement accèder à notre site web en tapant l'adresse suivante : ``http://caddyweb.ecotechsolutions.fr``

**Pour des raisons inconnus, nous avons du changer de serveur web car la page web de Caddy ne fonctionnait plus**