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
    GIT_URL=$(cat README.md | grep -i "Git-url" | sed 's/.*(\(.*\))/\1/')
    TAIGA_URL=$(cat README.md | grep -i "TAIGA-url" | sed 's/.*(\(.*\))/\1/')
    if !(test_url $GIT_URL)
    then
        echo $(ko) "Le lien Git fourni dans le 'README.md' n'est pas fonctionnel"
        exit 0
    fi
    if !(test_url $TAIGA_URL)
    then
        echo $(ko) "Le lien TAIGA fourni dans le 'README.md' n'est pas fonctionnel ${DEFAULT_COLOR}"
        exit 0
    fi
else
    echo $(ko) "Le fichier 'README.md' n'existe pas"
    exit 0
fi


if [ -e Team ]
then
    TEAM_EXISTING=true
    if [ -f Team/Members.md ]
    then
        MEMBERS_EXISTING=true
    else
        echo $(ko) "Le fichier 'Members.md' n'existe pas"
        exit 0
    fi
else
    echo $(ko) "Le dossier 'Team' n'existe pas"
    exit 0
fi

echo $(ok) "Exercice 1 terminé"




