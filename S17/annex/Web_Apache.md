# Mise en place d'un serveur Web

## Sommaire

1) Préparation de l'environnement

2) Mise à jour et installation de Docker

## Préparation de l'environnement

Pour pouvoir monter notre serveur web avec Apache, nous sommes passés par l'installation d'un conteneur Debian 12. Une fois installé et configuré pour être dans notre réseau du côté DMZ avec l'IP : 10.11.0.8/16, nous avons choisi d'installer Docker à partir du dépôt officiel.

## Mise à jour et installation de Docker

Tout d’abord, mettons à jour apt en ajoutant le dépôt Docker dans nos sources :

```bash
# Mise à jour et ajout de la clé GPG officielle :
apt update
apt install ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Ajout du dépôt à la liste (dans /etc/apt/sources.list.d)
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
```

Bien sûr, l'installation a été faite en mode "root", sinon il aurait fallu ajouter les droits avec "sudo".

### Installation de Docker avec apt :

```bash
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Visualisation des conteneurs en cours d'exécution

```bash
docker ps
```

### Exécution du conteneur en mode interactif

Ensuite, exécutons en mode interactif le conteneur "webserver" avec :

```bash
docker exec -it webserver bash
```

### Personnalisation du fichier index.html

Maintenant, nous allons personnaliser notre fichier index.html avec :

```bash
nano /var/www/html/index.html
```

HTML : 

```html
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Mét'info - Actu & Météo</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <header>
    <div class="logo">Monique</div>
    <div class="title">Mét'info - Actu & Météo</div>
    <div class="search">
      <input type="text" id="cityInput" placeholder="Rechercher une ville...">
      <button id="searchButton">Rechercher</button>
    </div>
    <button class="login-button">Log-In</button>
  </header>
  <main>
    <div class="time-container">
      <div id="time"></div>
      <div id="date"></div>
    </div>
    <div class="weather-container" id="weatherContainer">
      <!-- Les résultats météorologiques seront affichés ici -->
    </div>
  </main>
  <script src="script.js"></script>
</body>
</html>
```

Puis, nous créons deux fichiers supplémentaires :

```bash
touch /var/www/html/styles.css
touch /var/www/html/script.js
```

Nous remplissons les deux fichiers. "styles.css" avec du code CSS pour donner de la mise en forme à notre fichier HTML, et "script.js" pour ajouter de l'interactivité à la page. Une page dynamique est une page web qui peut changer et réagir aux actions de l'utilisateur sans avoir besoin de recharger la page entière.

CSS :

```css
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f4f4f4;
}

header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-color: #cc0000;
  padding: 10px 20px;
  color: white;
}

header .logo {
  font-size: 1.2em;
  font-weight: bold;
}

header .title {
  flex-grow: 1;
  text-align: center;
  font-size: 1.5em;
  font-weight: bold;
}

header .search {
  display: flex;
  align-items: center;
}

header .search input {
  padding: 5px;
  font-size: 1em;
  margin-right: 10px;
}

header .login-button {
  background-color: white;
  color: #cc0000;
  border: none;
  padding: 10px 15px;
  cursor: pointer;
  font-size: 1em;
  font-weight: bold;
  border-radius: 5px;
  margin-left: 10px;
}

main {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
}

.time-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
}

.time-container div {
  background-color: black;
  color: white;
  padding: 10px;
  font-size: 1.2em;
  text-align: center;
  margin: 5px 0;
}

.weather-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  width: 100%;
}

.weather-container div {
  margin: 10px 0;
  padding: 20px;
  background-color: #eeeeee;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  width: 80%;
  text-align: center;
}
```

JAVASCRIPT : 

```js
document.addEventListener('DOMContentLoaded', () => {
  const cityInput = document.getElementById('cityInput');
  const searchButton = document.getElementById('searchButton');
  const weatherContainer = document.getElementById('weatherContainer');
  const timeElement = document.getElementById('time');
  const dateElement = document.getElementById('date');

  // Fonction permettant d'obtenir et d'afficher des données météorologiques
  const fetchWeather = (city) => {
    fetch(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=7b4bd674c2f3d25858c84b9ae385b691&units=metric&lang=fr`)
      .then(response => response.json())
      .then(data => {
        if (data.cod === 200) {
          weatherContainer.innerHTML = `
            <div><strong>Ville:</strong> ${data.name}</div>
            <div><strong>Température:</strong> ${data.main.temp}°C</div>
            <div><strong>Description:</strong> ${data.weather[0].description}</div>
            <div><strong>Vent:</strong> ${data.wind.speed} km/h</div>
            <div><strong>Humidité:</strong> ${data.main.humidity}%</div>
          `;
        } else {
          weatherContainer.innerHTML = `<div>Ville non trouvée</div>`;
        }
      })
      .catch(error => {
        console.error('Error fetching weather data:', error);
        weatherContainer.innerHTML = `<div>Erreur lors de la récupération des données météo</div>`;
      });
  };

  // Récepteur d'événements pour le bouton de recherche
  searchButton.addEventListener('click', () => {
    const city = cityInput.value.trim();
    if (city) {
      fetchWeather(city);
    }
  });

  // Fonction de mise à jour de l'heure et de la date
  const updateTimeAndDate = () => {
    const now = new Date();
    timeElement.textContent = now.toLocaleTimeString('fr-FR');
    dateElement.textContent = now.toLocaleDateString('fr-FR');
  };

  // Mise à jour de l'heure et de la date toutes les secondes
  setInterval(updateTimeAndDate, 1000);
  updateTimeAndDate(); // Appel initial pour afficher immédiatement l'heure et la date
});
```

Ces fichiers seront liés à notre fichier index.html pour donner de la forme et un côté dynamique à notre page web.

Voici les commandes dans le fichier index.html qui les deux autres fichier :

```html
<link rel="stylesheet" href="styles.css">
<script src="script.js"></script>
```