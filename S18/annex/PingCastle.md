# Audit de Configuration AD via PingCastle

## Sommaire

1) Téléchargement et installation de PingCastle

2) Audit avec PingCastle

3) Lecture du rapport d'audit de PingCastle

## Téléchargement et installation de PingCastle

Pour télécharger PingCastle, accédez au [site officiel](https://www.pingcastle.com) et cliquez sur "Télécharger" dans la barre de menu en haut de la page. Dans la page qui s'ouvre, cliquez sur le bouton "Télécharger" afin d'obtenir l'archive ZIP qui contient les sources. Il suffit d'extraire le contenu du ZIP dans un dossier.

![alt text](/S18/ressource/pingcastle/PingCastle-1.png)

## Audit avec PingCastle

Une fois le ZIP téléchargé et extrait, se placer dans le dossier et lancez **PingCastle** de type `Application`.

![alt text](/S18/ressource/pingcastle/PingCastle-2.png)

Quand "**PingCastle**" se lance, une console s'ouvre. Pour demarrer un audit, il faut se positionner sur `1-healthscore-Score the risk of a domain` à l'aide des flèches et appuyer sur Entrée.

![alt text](/S18/ressource/pingcastle/PingCastle-3.png)

L'outil nous demande quel est le domaine Active Directory à auditer. Par défaut, il va remonter le domaine Active Directory correspondant au compte que vous utilisez, comme "ecotechsolutions.fr" dans notre cas. Si c'est le domaine à auditer, il suffit de valider avec Entrée pour demarrer l'audit.

![alt text](/S18/ressource/pingcastle/PingCastle-4.png)

Une fois l'audit terminé, apppuyez sur Entrée pour quitter l'outil.

![alt text](/S18/ressource/pingcastle/PingCastle-5.png)

## Lecture du rapport d'audit de PingCastle

Une fois l'audit terminé, l'outil créer deux rapport. Un premier au format `HTML` et un second au format `XML`. Celui qui va nous interesser est celui au format `HTML`.

![alt text](/S18/ressource/pingcastle/PingCastle-6.png)

La première zone nommée "Indicateur d'annuaire actif" permet d'avoir le niveau de risque de notre domaine, avec une note sur 100. Plus cette note est élevée, moins notre Active Directory est sécurisé ! Autrement dit, ici nous obtenons le score de 65/100, ce qui est une mauvaise note !

Si on descend un peu plus bas dans la page dans l'encadré, nous avons quatre scores où chaque score correspond à une catégorie, et on comprend que la note de "65/100" affichée en haut du rapport correspond à la note la plus élevée de ces quatre catégories. En aucun cas il s'agit d'un cumul ou d'une moyenne.

- **Stale Object** : points de sécurité liés aux utilisateurs ou aux ordinateurs
- **Privileged Accounts** : points de sécurité liés aux comptes avec des privilèges élevés (Administrateurs) du domaine Active Directory
- **Trusts** : points de sécurité liés aux relations d'approbations entre les domaines Active Directory
- **Anomalies** : points de sécurité liés à d'autres aspects de la configuration qui peuvent impacter la sécurité de votre annuaire

À chaque fois, il y a le nombre de règles qui ont matchées qui s'affiche, et chaque règle qui matche fait augmenter le score.

![alt text](/S18/ressource/pingcastle/PingCastle-7.png)

Le tableau "Modèle de risque" qui vient juste après permet d'en savoir un peu plus sur les risques que vous encourez avec la configuration actuelle de votre annuaire Active Directory. Quand la case est blanche, c'est tout bon. Quand elle est bleue également, sauf que vous pouvez tout de même améliorer votre configuration. Par contre, quand c'est jaune, c'est qu'il y a un peu de travail et les cases en orange et rouge doivent attirer votre attention tout particulièrement, car cela concerne les risques élevés et majeurs.

![alt text](/S18/ressource/pingcastle/PingCastle-8.png)

À partir du moment où on a passé la partie synthèse du rapport, on peut obtenir la liste des points de sécurité à améliorer. Pour chaque règle, il y a un nom, le nombre de points, ainsi qu'une description, une explication technique, des conseils détaillés pour solutionner ce problème et des liens vers des documentations pour vous aider.