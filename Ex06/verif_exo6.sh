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
MEMBER_URL_MAIN=$(echo $GIT_ORIGIN_URL | sed 's/\.git//g;s/github/raw.githubusercontent/g')/main/Team/Members.md
MEMBER_URL_DEVEL=$(echo $GIT_ORIGIN_URL | sed 's/\.git//g;s/github/raw.githubusercontent/g')/devel/Team/Members.md
rm -f /tmp/outMain
rm -f /tmp/outDevel
wget -q $MEMBER_URL_MAIN -O /tmp/outMain
wget -q $MEMBER_URL_DEVEL -O /tmp/outDevel
git checkout devel
diff -q Team/Members.md /tmp/outDevel
RSLT_DEVEL=$?
diff -q Team/Members.md /tmp/outDevel
RSLT_DEVEL_MAIN=$?
git checkout main
diff -q Team/Members.md /tmp/outMain
RSLT_MAIN=$?
NUM_OF_MEMBERS=$(wc -l Team/Members.md | awk {'printf $1'})

if [[ $NUM_OF_MEMBERS -lt 2 ]]
then
    echo $(ko) "Le fichier 'Members.md' n'a pas été bien rempli"
    exit 1
fi
if [[ $RSLT_MAIN -gt 0 ]]
    then
    echo $(ko) "La branche 'main' n'est pas à jour avec le repo Github"
    exit 1
fi

if [[ $RSLT_DEVEL -gt 0 ]]
    then
    echo $(ko) "La branche 'devel' n'est pas à jour avec le repo Github"
    exit 1
fi

if [[ $RSLT_DEVEL_MAIN -gt 0 ]]
    then
    echo $(ko) "Les branches 'devel' et 'main' ne sont pas similaires"
    exit 1
fi


echo $(ok) "Exercice 6 terminé"
exit 0
