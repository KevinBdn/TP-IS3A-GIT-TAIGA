#!/bin/bash

DEFAULT_COLOR=$(tput sgr0)
RED_COLOR=$(tput setaf 1)
GREEN_COLOR=$(tput setaf 2)

ko()
{
    echo "[${RED_COLOR}KO${DEFAULT_COLOR}]"
}

ok()
{
    echo "[${GREEN_COLOR}KO${DEFAULT_COLOR}]"
}



if [ "$(git tag)" != "" ]
then
    if [[ $(git branch) == *"test"* ]]
    then
        echo $(ok) "Exercice 9 terminé"
        exit 0
    else
        echo $(ko) "La branche 'test' n'a pas été créée"
        exit 1
    fi
else
    echo $(ko) "Aucun tag n'a été créé"
    exit 1
fi




