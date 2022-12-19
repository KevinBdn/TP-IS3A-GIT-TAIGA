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



if [[ $(git branch) != *"test"* ]]
    then
        echo $(ok) "Exercice 10 terminé"
        exit 0
    else
        echo $(ko) "La branche 'test' est toujours existante"
        exit 1
    fi
fi




