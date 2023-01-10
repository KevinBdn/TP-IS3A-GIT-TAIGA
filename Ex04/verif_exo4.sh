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


GIT_ORIGIN_URL=$(git remote get-url origin)
MEMBER_URL_DEVEL=$(echo $GIT_ORIGIN_URL | sed 's/github/raw.githubusercontent/g')/devel/Team/Members.md
MEMBER_URL_MAIN=$(echo $GIT_ORIGIN_URL | sed 's/github/raw.githubusercontent/g')/main/Team/Members.md
rm -f /tmp/outMain
rm -f /tmp/outDevel
wget -q $MEMBER_URL_DEVEL -O /tmp/outDevel
wget -q $MEMBER_URL_MAIN -O /tmp/outMain
git checkout main
diff -q Team/Members.md /tmp/outMain
RSLT_MAIN=$?
diff -q Team/Members.md /tmp/outDevel
RSLT_DEVEL=$?
NUM_OF_MEMBERS=$(wc -l Team/Members.md | awk {'printf $1'})

if [[ $NUM_OF_MEMBERS -eq 0 ]]
    then
    echo $(ko) "Le fichier 'Members.md' n'a pas été rempli"
    exit 1
fi

if [[ $RSLT_DEVEL -gt 0 ]]
then
    echo $(ko) "Le fichier 'Members.md' de la branche 'main' n'est pas à jour de la branche 'devel'"
    exit 1
fi

if [[ $RSLT_MAIN -gt 0 ]]
    then
    echo $(ko) "La branche 'main' n'est pas à jour sur le repo Github d'origine"
    exit 1
fi


echo $(ok) "Exercice 4 terminé"
exit 0
