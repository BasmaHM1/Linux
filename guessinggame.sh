#!/bin/bash

# Fonction pour obtenir le nombre de fichiers dans le répertoire courant
function get_file_count {
    # Compte le nombre de fichiers visibles (ignorer . et ..)
    echo $(ls -1 | wc -l)
}

# Stocke le nombre de fichiers dans une variable
file_count=$(get_file_count)

# Message de bienvenue
echo "Bienvenue dans le jeu des devinettes !"
echo "Pouvez-vous deviner combien de fichiers se trouvent dans le répertoire actuel ?"

# Boucle pour demander continuellement à l'utilisateur jusqu'à ce qu'il trouve la bonne réponse
while true; do
    # Invite l'utilisateur à saisir une réponse
    read -p "Entrez votre estimation : " user_guess

    # Vérifie si l'entrée est un nombre
    if ! [[ $user_guess =~ ^[0-9]+$ ]]; then
        echo "Veuillez entrer un nombre valide."
        continue
    fi

    # Compare l'entrée utilisateur avec le nombre réel de fichiers
    if [[ $user_guess -lt $file_count ]]; then
        echo "Trop bas, essayez à nouveau."
    elif [[ $user_guess -gt $file_count ]]; then
        echo "Trop haut, essayez à nouveau."
    else
        echo "Félicitations ! Vous avez trouvé le bon nombre de fichiers : $file_count"
        break
    fi
done
