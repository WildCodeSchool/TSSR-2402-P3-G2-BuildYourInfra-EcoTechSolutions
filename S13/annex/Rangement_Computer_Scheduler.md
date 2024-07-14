# Déplacement des machines dans l'AD

## Sommaire

1) Script

2) Planification dans le Task Scheduler

## Script

1. Exécuter le script `00_Main_AD` situé dans le `C:\Admin\ActiveDirectory`.

![script](/S11/ressource/script/adds/Scripts_AD_01.PNG)

2. Choisissez l'Option `5 - Rangement Computer + Ajout au Groupe`.

![script](/S11/ressource/script/adds/Scripts_AD_02.PNG)

3. Le script s'éxécute, il va piocher les ordinateurs en consultant le dernier fichier .csv du personnel, et les ranger en fonction du département et/ou service de l'utilisateur, ainsi que l'ajouter au Groupes `GRP_EcoT_Computers`, `GRP_EcoT_Computers_Département` et `GRP_EcoT_Computers_Département_Service` (si existant).

![script](/S11/ressource/script/adds/Scripts_AD_10.PNG)

## Planification dans le Task Scheduler

1. Ouvrez le `Task Scheduler` via la recherche Windows.

![scheduler](/S13/ressource/scheduler/Task_Scheduler_01.PNG)

2. Une fois le `Task Scheduler` ouvert, cliquez `Action` puis `Create Task`.

![scheduler](/S13/ressource/scheduler/Task_Scheduler_02.PNG)

3. Sur l'onglet `General`, remplissez les champs `Name` et `Description` et sélectionnez l'option `Run whether user is logged on or not` (afin de forcer le démarrage de la tâche même si l'Administrateur n'est pas connecté).

![scheduler](/S13/ressource/scheduler/Task_Scheduler_03.PNG)

4. Sur l'onglet `Triggers`, cliquez sur `New`.

![scheduler](/S13/ressource/scheduler/Task_Scheduler_04.PNG)

5. Sélectionnez `Daily`, ainsi qu'une heure d'éxécution puis cliquez sur `OK`.

![scheduler](/S13/ressource/scheduler/Task_Scheduler_05.PNG)

6. Sur l'onglet `Actions`, cliquez sur `New`.

![scheduler](/S13/ressource/scheduler/Task_Scheduler_06.PNG)

7. Remplissez les champs `Program/Script` pour exécuter `powershell.exe`, ainsi que le champ `Add argument (optiional)` avec le chemin du script puis `OK`.

![scheduler](/S13/ressource/scheduler/Task_Scheduler_07.PNG)

8. Sur l'onglet `Conditions`, rien à modifier. 

![scheduler](/S13/ressource/scheduler/Task_Scheduler_08.PNG)

9. Sur l'onglet `Settings`, rien à modifier, cliquez sur `OK`.

![scheduler](/S13/ressource/scheduler/Task_Scheduler_09.PNG)

10. Saisissez le mot de passe `Administrator` afin de valider la tâche.

![scheduler](/S13/ressource/scheduler/Task_Scheduler_10.PNG)

11. Votre tâche est fonctionnelle, elle apparait dans `Active Tasks`.

![scheduler](/S13/ressource/scheduler/Task_Scheduler_11.PNG)