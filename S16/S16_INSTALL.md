# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

## **Installation et Configuration des équipements et ressources**

### Installation du Server WSUS

WSUS signifie Windows Server Update Service et il s’agit du rôle intégré à Windows Server qui a une mission bien précise, la distribution des mises à jour des produits Microsoft sur les postes de travail et serveurs de notre entreprise.

L’installation du rôle WSUS sur Windows Server 2022

Ouvrez le " Gestionnaire de serveur ", cliquez sur " Manage " puis " Add Roles and Features "

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-1.png)

Passons le premier écran en cliquant sur " Next "

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-2.png)

Nous sélectionnons la première option, puis nous cliquons sur "Next".

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-3.png)

Nous sélectionnons le serveur approprié, puis nous cliquons sur "next".

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-4.png)

Nous sélectionnons le service "Windows Server Update Services" dans la liste des rôles serveur.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-5.png)

Ensuite, nous cliquons sur le bouton "Add Features", puis sur "Next"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-6.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-7.png)

Pour les deux étapes suivantes, nous cliquons également sur le bouton "Next".

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-8.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-9.png)

Maintenant, nous entrons le chemin d'accès du disque où nous souhaitons stocker les mises à jour.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-10.png)

Ensuite, nous cliquons sur le bouton "Suivant", puis de nouveau sur "Suivant", et enfin sur "Installer".

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-11.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-12.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-13.png)

Une fois l'installation terminée, nous cliquons sur le bouton "Fermer" pour fermer la fenêtre.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-14.png)

Enfin, nous cliquons sur le petit drapeau jaune situé en haut à droite de la fenêtre de "Server Manager", puis nous sélectionnons "Post-installation" dans le menu déroulant pour lancer la procédure de post-installation

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-15.png)

### Configuration de base de WSUS

WSUS est installé sur notre serveur et la base de données est créée. Désormais, nous pouvons lancer la console « Services WSUS » afin d’effectuer la configuration de base. Pour ce faire nous allons dans manage server et en haut a droite "Tools".

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-1.png)

Pour la première étape,  nous cliquons sur "Next"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-2.png)

Nous décochons le faite de joindre le programme de Microsoft Update puis "Next"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-3.png)

Nous laissons sur "Synchronize from Microsoft Update" puis "Next"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-4.png)

Nous n'avons pas de serveur proxy a entrer. Nous cliquons sur "Next"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-5.png)

Maintenant nous lançons "Start Connecting", une fois terminé nous cliquons sur "Next"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-6.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-7.png)

Comme nous avons des ordinateurs en francais et en anglais nous selectionnons "French" et "English" pour le choix de langues des mises a jour

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-8.png)

Dans l'images suivante j'ai laissé par défaut, mais nous devons sélectionner les produits pour lesquels nous souhaitons synchroniser les mises à jour. La liste est très longue et très complète, nous devons cocher les produits correspondants à ceux que nous utilisons !

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-9.png)

L’étape suivante concerne la classification des mises à jour, c’est-à-dire les types de mises à jour qu’il faut synchroniser sur le serveur WSUS

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-10.png)

La synchronisation des mises à jour avec les serveurs Microsoft Update doit être planifiée afin d’être sûr de recevoir les dernières mises à jour. De préférence, cette synchronisation sera planifiée la nuit afin de ne pas perturber la production

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-11.png)

Cochez l’option « Begin initial synchronization » si vous souhaitez réaliser une première synchronisation dès maintenant.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-12.png)

Nous cliquons sur "Finish"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-13.png)




## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**
