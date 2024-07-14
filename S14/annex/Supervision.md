# Supervision de l'Infrastructure

## Sommaire

1) Installation sur conteneur (via Docker) de Grafana et Prometheus

2) Installation Node Exporter

3) Installation de l'agent sur Windows Server

4) Supervision des éléments dans l'infra

5) Mise en place de tableau de bord

## Installation sur conteneur (via Docker) de Grafana et Prometheus

En, effet, nous avons décidé de mettre en place la solution logiciel Docker depuis laquelle nous déployons deux conteneurs qui acueillent respectivement Grafana (essentiellement pour la lisibilité de l'interface graphique) et Prométhéus.

Pour ce faire, nous avons monté un conteneur sous Linux Debian dans lequel nous avons procéder à l'installation de Docker :

``sudo apt-get update && sudo apt-get upgrade -y``
``sudo apt-get install docker.io``

Nous faisons un "pull" pour obtenir l'image de Grafana:

``docker pull grafana/grafana``

Ici, nous associons au conteneur le couple de port qui permettra le transfert de communications : 3000:3000

``docker run -d --name=grafana -p 3000:3000 grafana/grafana``

Ici, on peut vérifier si notre conteneur est "en route":

``docker ps``

Depuis l'autre conteneur nous déployons Prometheus:

``docker pull prom/prometheus``

Puis:

``docker run -d --name=prometheus -p 9090:9090 prom/prometheus``

## Installation Node Exporter

Ici, nous travaillerons avec l’utilisateur « root » car nous sommes dans un environnement laboratoire mais il est 
conseillé de travailler avec un utilisateur ayant les droits « sudo » lorsque vous travaillez sur une machine en 
production.

On commence par télécharger les dernières sources de Prométhéus via : https://prometheus.io/download/

``wget https://github.com/prometheus/prometheus/releases/download/v2.53.0-rc.1/prometheus-2.53.0-rc.1.linux-amd64.tar.gz``

Une fois télécharger, on le décompressons:

``tar -xzf prometheus-2.53.0.linux-amd64.tar.gz``

Déplacez le dossier décompressé dans « /usr/share/prometheus » à l’aide de la commande « mv »:

``mv prometheus-2.53.0.linux-amd64/node_exporter /usr/local/bin/``

Nous allons chercher à le déployer en tant que service. Et pour cela nous créeons un utilisateur "fictif":

``useradd -rs /bin/false node_exporter``

Nous créeons le fichier du service en question:

``nano /etc/systemd/system/node_exporter.service``

En ajoutant ce contenu:

```
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
```

On recharge, on démarre, on vérifie le statut et on ajouter au service de démarrage

```
systemctl daemon-reload
systemctl start node_exporter
systemctl status node_exporter
systemctl enable node_exporter
```

On vérifie que tout fonctionne:

``curl http://localhost:9100/metrics``
Si nous n'avons pas *curl* : ``apt-get install curl``

Maintenant pour ajouter l'hôte (conteneur) à Prometheus. Pour cela, nous touchons au fichier de configuration de Prometheus:

``nano /etc/prometheus/prometheus.yml``

Nous ajoutons :

```
  - job_name: 'node_exporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9100']
      - targets: ['10.10.8.114:9100']
```

On redémarre le service *prometheus*:

``systemctl restart prometheus``

## Installation de l'agent sur Windows Server

### Installer le WMI Exporter

Il y a un pré-requis à ce stade: **chocolatey**.
Pour télécharger Chocolatey nous entrons la commande suivante :

``Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))``

Ensuite, nous réalisons : ``choco install prometheus-wmi-exporter.install``

**Télécharger le WMI Exporter** :

Accédez à la page de releases du WMI Exporter sur GitHub.
Téléchargez le fichier MSI correspondant à la version souhaitée.

**Installer le WMI Exporter** :

Exécutez le fichier MSI téléchargé et suivez les instructions pour installer le WMI Exporter.
Le WMI Exporter sera installé en tant que service Windows et commencera à s'exécuter automatiquement.

### Vérifier que le WMI Exporter fonctionne

**Vérifier le service** :

Ouvrez le Gestionnaire des services (services.msc) et assurez-vous que le service wmi_exporter est en cours d'exécution.

**Vérifier l'endpoint de métriques** :

Ouvrez un navigateur web et accédez à http://localhost:9182/metrics.
Vous devriez voir une page de texte avec des métriques exposées par le WMI Exporter.

### Configurer Prometheus pour scraper les métriques du WMI Exporter

**Modifier le fichier de configuration de Prometheus** :

Ouvrez le fichier de configuration de Prometheus (généralement nommé prometheus.yml).

**Ajouter un job pour le WMI Exporter** :

Ajoutez la configuration suivante au fichier prometheus.yml :

    scrape_configs:
      - job_name: 'wmi_exporter'
        scrape_interval: 15s
        static_configs:
          - targets: ['<IP_de_la_machine_Windows>:9182']

Remplacez <IP_de_la_machine_Windows> par l'adresse IP de votre machine Windows où le WMI Exporter est installé. Si Prometheus et le WMI Exporter sont sur la même machine, utilisez localhost.

**Redémarrer Prometheus** :

Redémarrez le service Prometheus pour appliquer les modifications :

``sudo systemctl restart prometheus``

### Vérifier que Prometheus scrape les métriques

**Accéder à l'interface web de Prometheus** :

Ouvrez un navigateur web et accédez à l'interface web de Prometheus, généralement disponible à http://localhost:9090.

**Vérifier les targets** :

Allez dans le menu "Status" > "Targets".
Vous devriez voir wmi_exporter dans la liste des targets. Son statut doit être "UP".

**Explorer les métriques** :

Allez dans le menu "Graph" et tapez le nom d'une métrique exposée par le WMI Exporter, par exemple wmi_cpu_time_total.
Cliquez sur "Execute" pour voir les données de la métrique.

### S'assurer du bon déploiement des services ainsi que des droits des utilisateurs respectifs.

## Supervision des éléments dans l'infra

## Mise en place de tableau de bord