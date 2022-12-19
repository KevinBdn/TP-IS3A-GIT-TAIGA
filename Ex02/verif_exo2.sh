#!/bin/bash

DEFAULT_COLOR=$(tput sgr0)
RED_COLOR=$(tput setaf 1)
GREEN_COLOR=$(tput setaf 2)

test_url()
{
    curl --output /dev/null --silent --head --fail $1
}

ko()
{
    echo "[${RED_COLOR}KO${DEFAULT_COLOR}]"
}

ok()
{
    echo "[${GREEN_COLOR}KO${DEFAULT_COLOR}]"
}

if [ -e README.md ]
then
    GIT_UPSTREAM_URL=$(cat README.md | grep -i "Git-url" | sed 's/.*(\(.*\))/\1/')

    if [ $(git remote get-url upstream) == $GIT_UPSTREAM_URL ]
    then
        echo $(ok) "Exercice 2 terminé"
        exit 1
    else
        echo $(ko) "Le remote repository upstream n'est pas bien configuré"
        exit 0
    fi
    
else
    echo $(ko) "Le fichier 'README.md' n'existe pas"
    exit 0
fi






