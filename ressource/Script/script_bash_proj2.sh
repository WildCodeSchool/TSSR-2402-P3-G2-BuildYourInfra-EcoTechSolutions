#!/bin/bash

######################### https://github.com/RehanSaeed/Bash-Cheat-Sheet ###################################
################################### liste de commandes bash ################################################
############################################################################################################
#######################################   action fonction   ################################################
############################################################################################################

#Vérification si l'utilisateur existe

function userExists () {
    if cat /etc/passwd | grep $1
        then
            echo "Utilisateur $1 existe"
            return 0
    else
        echo "Veuillez créer cette $1 dans le menu Gestion de compte."
        return 1
    fi
}

#Création de compte utilisateur local avec mot de passe :

function createUser () {
    sudo adduser $1
    echo "utilisateur $user créé"
    exit 0
}
#Changement de mot de passe :

function changeMDP () {
    
    sudo passwd $1
    echo "modification $MDP réussi"
    exit 0
}

#Suppression de compte utilisateur local :

function delUser () {
    sudo deluser $1
    echo "suppression $User réussi"
    exit 0
}

#Activation de compte utilisateur local :

function activ_User () {
    if passwd -S $1
        then
            echo "l'$1 est déjà désactivé !"
            return 0
    else
            sudo usermod -U $1
            echo "activation de $User réussi"
            return 0
    fi
}

#Désactivation de compte utilisateur local :

function desactiv_User () {
    if passwd -S $1
        then
            echo "l'$1 est déjà désactivé !"
            return 0
    else
            sudo usermod -L $1
            echo "désactivation $User réussi"
            return 0
    fi

}

#Ajout à un groupe d'administrateur :
#-nG affiche les noms de tous les groupes auxquels appartient l'utilisateur
function add_admin () {
    if id -nG $1 | grep -qw sudo
        then
        echo "Cette utilisateur est déja dans le groupe administrateur."
        return 1
    else
        sudo usermod -aG sudo $1
        echo "ajout de $User en tant que administrateur"
        return 0
    fi
}

#Ajout à un groupe local :

function add_Grp_local () {
    if id -nG $1 | grep -qw users 
        then
        echo "Cette utilisateur est déjà dans le groupe local"
        return 1
    else
        sudo usermod -aG users $1
        echo "ajout de $User au groupe local"
        return 0
    fi
}

#Sortie d'un groupe local :

function sortie_Grp_local () {
    if ! ( id -nG $1 | grep -qw users )
        then
        echo "Cette utilisateur n'est pas dans le groupe local"
        return 0
    else
        sudo deluser $User "nom de groupe"
        echo "sortie de $User du groupe local"
        return 0
    fi
}

#Arrêt de l'ordinateur :

function stop_ordi () {
    echo "Arrêt de l'ordinateur client"
    sleep 3
    sudo shutdown -h now
    return 0
}

#Redémarrage de l'ordinateur :

function restart_ordi () {
    echo "L'ordinateur va redémarrer"
    sleep 3
    sudo reboot
    return 0
}

#Verrouillage de l'ordinateur :

function verrouiller_ordi () {
    echo "L'ordinateur va être en veille"
    sleep 3
    sudo systemctl suspend   
    return 0
}

#Mise à jour du système :

function maj_systeme () {
    echo "Mise à jour du système lancé"
    sleep 3
    sudo apt update && sudo apt upgrade -y
    return 0
}

#Création de répertoire :

function create_directory () {
    read -p "Entrez le nom du dossier a créer :" create_dossier
    mkdir $create_dossier
    echo "creation du repertoire"
    return 0
}

#Modification de répertoire :

function modify_directory () {
    read -p "Entrez le nom de dossier a modifier : " mod_dossier
    if mv $mod_dossier #<nouveau nom>
        then
            echo "modification du répertoire"
        return 0
    else
        echo "le dossier $mod_dossier n'existe pas!"
        return 1
    fi
}

#Suppression de répertoire :

function del_directory () {
    real -p "Entrez le nom du dossier a supprimé :" del_dossier
    rm -r del_dossier
    sleep 2
    echo "suppression du répertoire"
    return 0
}

#Prise de main à distance de l'ordinateur client :

function  prise_main_distance () {
    ssh #user@adresse_ip
    echo "ajout de $User au groupe local"
    exit 0
}

#Activation du pare-feu :

function activer_pare_feu () {
    sudo ufw enable
    echo "activation du pare-feu"
    exit 0
}

#Désactivation du pare-feu :

function desactiver_pare_feu () {
    sudo ufw disable
    echo "désactivation du pare-feu"
    exit 0
}
############################################################################################################
#####################################   information fonction   #############################################
############################################################################################################
#Date de dernière connexion de l'utilisateur :

function date_derniere_connexion () {
    lastlog #nom_user
    echo "Affiche la date de dernière connexion de l'utilisateur"
    exit 0
}

#Date de dernière modification du mot de passe :

function date_derniere_modif_mot_de_passe () {
    chage -l #nom_user
    echo "Affiche la date de dernière modification du mot de passe."
    exit 0
}

#    Liste des sessions ouvertes par l'utilisateur :

function liste_sessions_utilisateur () {
    sudo w -u #nom_user
    echo "Affiche la liste des sessions ouvertes par l'utilisateur"
    exit 0
}

#    Groupe d'appartenance d'un utilisateur :

function groupe_appartenance_utilisateur () {
    groups #nom_user
    echo "Affiche le groupe d'appartenance de l'utilisateur"
    exit 0
}

#    Historique des commandes exécutées par l'utilisateur :

function history_cmd_User () { 
    history | grep #nom_user
    echo "Affiche l'historique des commandes exécutées par l'utilisateur"
    exit 0
}

#Droits et permissions de l'utilisateur sur un dossier :

function droits_permissions_dossier () {
    ls -ld #/chemin/du/dossier
    echo "Affiche les droits et permissions de l'utilisateur sur le dossier"
    exit 0
}

#    Droits et permissions de l'utilisateur sur un fichier :

function droits_permissions_fichier () {
    ls -l #chemin/du/fichier
    echo "Affiche les droits et permissions de l'utilisateur sur le fichier"
    exit 0
}

#Version de l'OS de l'ordinateur client :

function version_os () {
    lsb_release -a
    echo "Affiche la version de l'os du client"
    exit 0
}

#Nombre de disques de l'ordinateur client :

function nombre_disques () {
    lsblk | grep disk | wc -l
    echo "Affiche le nombre de disque du client"
    exit 0
}

#Partition par disque de l'ordinateur client :

function partition_par_disque () {
    sudo fdisk -l
    echo "Affiche les informations sur les partitions par disque du client"
    exit 0
}

#Nom et espace disque d'un dossier :

function espace_disque_dossier () {
    du -sh #/chemin/du/dossier
    echo "Affiche le nom et l'espace disque du dossier"
    exit 0
}

#Liste des lecteurs montés :

function lecteurs_montes () {
    df -h
    echo "Affiche le liste des lecteurs montés"
    exit 0
}

#Nombre d'interfaces et adresse ip :

function interfaces_ip () {
    sudo netstat -i | --interfaces && ip addr #a verifier 
    echo "Affiche le nombre d'interfaces et leur adresse ip"
    exit 0
}

#Liste des ports ouverts :

function ports_ouverts () {
    sudo netstat -l | --listening && ip addr
    echo "Affiche la liste des ports ouverts"
    exit 0
}

#Statut du pare-feu :

function statut_pare_feu () {
    sudo ufw status
    echo "Affiche le statut du pare-feu"
    exit 0
}

#Recherche des événements dans le fichier log_evt.log pour un utilisateur :

function recherche_evenements_utilisateur () {
    grep "nom_user" #/chemin/dufichier/log_evt.log
    echo "Affiche es evenements du fichier log_evt.log pour un utilisateur"
    exit 0
}

#Recherche des événements dans le fichier log_evt.log pour un ordinateur :

function recherche_evenements_ordinateur () {
    grep "adresse_ip" #/chemin/dufichier/log_evt.log
    echo "Affiche les événements du fichier log_evt.log pour un ordinateur"
    exit 0
}

function optionGestion()
{
    echo "choisir un option"
    echo "1. menu de gestion"
    echo "2. gestion compte"
    echo "3. gestion groupe"
    echo "4. gestion systeme"
    echo "5. gestion repertoire"
    echo "6. gestion securité"
    echo "7. gestion logiciel"
    echo "8. gestion bureau a distance"
}

function optionInformation()
{
    echo "choisir un option"
    echo "1. information utilisateur"
    echo "2. information système client"
}
#menu gestion ou information

 while true; do
    option
    read -p "Inserer le numéro de l'option : " choix    

    case $choix in
        1)  
            echo "Vous avez choisi la gestion de compte."
            # Boucle pour afficher le sous-menu de gestion de compte
            while true; do
                echo "Menu gestion de compte :"
                echo "1. Créer un utilisateur"
                echo "2. Changer le mot de passe d'un utilisateur"
                echo "3. Supprimer un utilisateur"
                echo "4. Désactiver un compte utilisateur"
                echo "5. Ajouter à un groupe d'administrateur"
                echo "6. Ajouter à un groupe local"
                echo "7. Sortir d'un groupe local"
                echo "8. Revenir au menu principal"
                read -p "Choix : " gestCompte

                case $gestCompte in
                    1)  
                        echo "Créer un utilisateur"
                        # Ajouter code créer un utilisateur
                        ;;
                    2)  
                        echo "Changer le mot de passe d'un utilisateur"
                        # Ajouter code changer le mot de passe
                        ;;
                    3)  
                        echo "Supprimer un utilisateur"
                        # Ajouter code supprimer un utilisateur
                        ;;
                    4)  
                        echo "Désactiver un compte utilisateur"
                        # Ajouter code désactiver un compte utilisateur
                        ;;
                    5)  
                        echo "Ajouter à un groupe d'administrateur"
                        # Ajouter code ajout à un groupe d'administrateur
                        ;;
                    6)  
                        echo "Ajouter à un groupe local"
                        # Ajouter code ajout à un groupe local
                        ;;
                    7)  
                        echo "Sortir d'un groupe local"
                        # Ajouter code sortir d'un groupe local
                        ;;
                    8)  
                        echo "Retour au menu principal"
                        break  # Sortir de la boucle interne
                        ;;
                    *)  
                        echo "Option invalide. Veuillez choisir une option valide."
                        ;;
                esac
            done
            ;;
        2)  
            echo "Vous avez choisi la gestion système."
            # Boucle pour afficher le sous-menu de gestion système
            while true; do
                echo "Menu gestion de système :"
                echo "1. arrêt de l'ordinateur"
                echo "2. redémarrage"
                echo "3. verrouillage"
                echo "4. mise-à-jour du système"
                echo "5. création de répertoire"
                echo "6. modification de répertoire"
                echo "7. suppression de répertoire"
                echo "8. activation du pare-feu"
                echo "9. désactivation du pare-feu"
                echo "10. installation de logiciel"
                echo "11. désinstallation de logiciel"
                echo "12. Revenir au menu principal"
                read -p "Choix : " gestSystem

                case $gestSystem in
                    1)  
                        echo "1. arrêt de l'ordinateur"
                        # Ajouter code arrêt de l'ordi
                        ;;
                    2)  
                        echo "2. redémarrage"
                        # Ajouter code redémarrage
                        ;;
                    3)  
                        echo "3. verrouillage"
                        # Ajouter code verrouillage
                        ;;
                    4)  
                        echo "4. mise-à-jour du système"
                        # Ajouter code maj du système
                        ;;
                    5)  
                        echo "5. création de répertoire"
                        # Ajouter code création de répertoire
                        ;;
                    6)  
                        echo "6. modification de répertoire"
                        # Ajouter code modification répertoire
                        ;;
                    7)  
                        echo "7. suppression de répertoire"
                        # Ajouter code suppression de répertoire
                        ;;
                    8)  
                        echo "8. activation du pare-feu"
                        # Ajouter code activation du pare-feu 
                        ;;
                    9)  
                        echo "9. désactivation du pare-feu"
                        # Ajouter code Désactivation du pare-feu
                        ;;
                    10)
                        echo "10. installation de logiciel"
                        # Ajouter code installation de logiciel
                        ;;
                    11)
                        echo "11. désinstallation de logiciel"
                        # Ajouter code désinstallation de logiciel
                        ;;
                    12)
                        echo "12. Revenir au menu principal"
                        ;;
                    *)
                        echo "Option invalide. Veuillez choisir une option valide."
                        ;;
                esac
            done
            ;;
        3)  
            echo "Vous avez choisi gestion des informations utilisateur."
            while true; do
                echo "Menu gestion des informations :"
                echo "1. Date de dernière connexion d'un utilisateur"
                echo "2. Date de dernière modification du mot de passe"
                echo "3. Liste des sessions ouvertes par l'utilisateur"
                echo "4. Groupe d'appartenance d'un utilisateur"
                echo "5. Historique des commandes exécutées par l'utilisateur"
                echo "6. Droits/permissions de l'utilisateur sur un dossier"
                echo "7. Droits/permissions de l'utilisateur sur un fichier"
                echo "8. Revenir au menu principal"
                read -p "Choix : " infUser

                case $infUser in
                    1)  
                        echo "1. Date de dernière connexion d'un utilisateur"
                        # Ajouter code date dernière connexion utilisateur
                        ;;
                    2)  
                        echo "2. Date de dernière modification du mot de passe"
                        # Ajouter code date dernière modification du Mdp
                        ;;
                    3)  
                        echo "3. Liste des sessions ouvertes par l'utilisateur"
                        # Ajouter code liste sessions ouvertes
                        ;;
                    4)  
                        echo "4. Groupe d'appartenance d'un utilisateur"
                        # Ajouter code Grp appartenance utilisateur
                        ;;
                    5)  
                        echo "5. Historique des commandes exécutées par l'utilisateur"
                        # Ajouter code historique commandes exécutées par utilisateur
                        ;;
                    6)  
                        echo "6. Droits/permissions de l'utilisateur sur un dossier"
                        # Ajouter code D/P utilisateur sur dossier
                        ;;
                    7)  
                        echo "7. Droits/permissions de l'utilisateur sur un fichier"
                        # Ajouter code D/P utilisateur sur un fichier
                        ;;
                    8)  
                        echo "8. Revenir au menu principal"
                        # Ajouter code activation du pare-feu 
                        ;;
                    *)
                        echo "Option invalide. Veuillez choisir une option valide."
                        ;;
                esac
            done
            
            ;;
        4)  
            echo "Vous avez choisi la gestion des informations ordinateur client"
            # 
             while true; do
                echo "Menu gestion des informations ordinateur client :"
                echo "1. Version de l'OS"
                echo "2. Nombre de disque"
                echo "3. Partition par disque"
                echo "4. Espace disque restant par partition/volume"
                echo "5. Nom et espace disque d'un dossier"
                echo "6. Liste des lecteurs montés"
                echo "7. Nombre d'interface"
                echo "8. Adresse IP de chaque interface"
                echo "9. Adresse Mac"
                echo "10. Liste des ports ouverts"
                echo "11. Statut du pare-feu"
                echo "12. Revenir au menu principal"
                read -p "Choix : " postInfCli

                case $postInfCli in
                    1)  
                        echo "1. Version de l'OS"
                        # Ajouter code version OS
                        ;;
                    2)  
                        echo "2. Nombre de disque"
                        # Ajouter code Nbr disk
                        ;;
                    3)  
                        echo "3. Partition par disque"
                        # Ajouter code partition par disk
                        ;;
                    4)  
                        echo "4. Espace disque restant par partition/volume"
                        # Ajouter code espace disk restant
                        ;;
                    5)  
                        echo "5. Nom et espace disque d'un dossier"
                        # Ajouter code nom et espace disk dossier
                        ;;
                    6)  
                        echo "6. Liste des lecteurs montés"
                        # Ajouter code liste lecteurs montés
                        ;;
                    7)  
                        echo "7. Nombre d'interface"
                        # Ajouter code Nbr interface
                        ;;
                    8)  
                        echo "8. Adresse IP de chaque interface"
                        # Ajouter code adresse IP chaque interface
                        ;;
                    9)  
                        echo "9. Adresse Mac"
                        # Ajouter code adresse Mac
                        ;;
                    10)
                        echo "10. Liste des ports ouverts"
                        # Ajouter code liste des ports
                        ;;
                    11)
                        echo "11. Statut du pare-feu"
                        # Ajouter code stat pare-feu
                        ;;
                    12)
                        echo "12. Revenir au menu principal"
                        ;;
                    *)
                        echo "Option invalide. Veuillez choisir une option valide."
                        ;;
                esac
            done
            ;;
        5)
            echo "Vous avez choisi la recherche des evenements"
                 while true; do
                echo "Menu gestion des recherches evenements sur fichier log_evt.log:"
                echo "1. Recherche pour un utilisateur"
                echo "2. Recherche pour un ordinateur"
                echo "3. Revenir au menu principal"
                read -p "Choix : " rech_even

                case $rech_even in
                    1)  
                        echo "1. Recherche pour un utilisateur"
                        # Ajouter code recherche
                        ;;
                    2)  
                        echo "2. Recherche pour un ordinateur"
                        # Ajouter code recherche
                        ;;
                    3)
                        echo "3. Revenir au menu principal"
                        ;;
                    *)
                        echo "Option invalide. Veuillez choisir une option valide."
                        ;;
                esac 
               done
            ;;
        6)  
            echo "Au revoir !"
            exit 0
            ;;
        *)  
            echo "Choix non valide. Veuillez choisir une option valide."
            ;;
    esac
done
