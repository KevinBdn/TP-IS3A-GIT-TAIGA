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


if [[ $(git branch) == *"devel"* ]]
then 
    GIT_ORIGIN_URL=$(git remote get-url origin)
    MEMBER_URL=$(echo $GIT_ORIGIN_URL | sed 's/github/raw.githubusercontent/g')/devel/Team/Members.md
    if !(test_url $MEMBER_URL)
    then
        echo $(ko) "La branche 'devel' n'est pas à jour sur le repo Github d'origine"
        exit 1
    fi
    rm -f /tmp/out
    wget -q $MEMBER_URL -O /tmp/out
    git checkout devel
    diff -q Team/Members.md /tmp/out
    RSLT_DEVEL=$?
    NUM_OF_MEMBERS=$(wc -l Team/Members.md | awk {'printf $1'})

    if [[ $NUM_OF_MEMBERS -eq 0 ]]
        then
        echo $(ko) "Le fichier 'Members.md' n'a pas été rempli"
        exit 1
    fi

    if [[ $RSLT_DEVEL -gt 0 ]]
        then 
        echo $(ko) "Le fichier 'Members.md' est différent sur la branche 'devel' et l'origine"
        exit 1
    fi

else
    echo $(ko) "La branche 'devel' n'a pas été créée"
    exit 1
fi

echo $(ok) "Exercice 3 terminé"
exit 0
