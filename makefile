# Règle pour générer le fichier README.md
README.md: guessinggame.sh
	echo "# Guessing Game Project" > README.md
	echo "\nDate et heure de génération : $$(date)" >> README.md
	echo "\nNombre de lignes dans guessinggame.sh : $$(wc -l < guessinggame.sh)" >> README.md

# Règle par défaut
all: README.md
