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



GIT_URL_OR=$(git remote get-url origin)
GIT_URL_UP=$(cat README.md | grep -i "Git-url" | sed 's/.*(\(.*\))/\1/')
MEMBER_URL_OR_MAIN=$(echo $GIT_URL_OR | sed 's/github/raw.githubusercontent/g')/main/Team/Members.md
MEMBER_URL_OR_DEVEL=$(echo $GIT_URL_OR | sed 's/github/raw.githubusercontent/g')/devel/Team/Members.md
MEMBER_URL_UP_MAIN=$(echo $GIT_URL_UP | sed 's/github/raw.githubusercontent/g')/main/Team/Members.md
MEMBER_URL_UP_DEVEL=$(echo $GIT_URL_UP | sed 's/github/raw.githubusercontent/g')/devel/Team/Members.md

rm -f /tmp/outMainOr
rm -f /tmp/outDevelOr
rm -f /tmp/outMainUp
rm -f /tmp/outDevelUp

wget -q $MEMBER_URL_OR_MAIN -O /tmp/outMainOr
wget -q $MEMBER_URL_OR_DEVEL -O /tmp/outDevelOr
wget -q $MEMBER_URL_UP_MAIN -O /tmp/outMainUp
wget -q $MEMBER_URL_UP_DEVEL -O /tmp/outDevelUp

git checkout devel
diff -q Team/Members.md /tmp/outDevelOr
RSLT_DEVEL_OR=$?
diff -q Team/Members.md /tmp/outDevelUp
RSLT_DEVEL_UP=$?

git checkout main
diff -q Team/Members.md /tmp/outMainOr
RSLT_MAIN_OR=$?
diff -q Team/Members.md /tmp/outMainUp
RSLT_MAIN_UP=$?

diff -q /tmp/outMainUp /tmp/outMainOr
RSLT_MAIN_MAIN=$?

diff -q /tmp/outDevelUp /tmp/outDevelOr
RSLT_DEVEL_DEVEL=$?


if [[ $RSLT_DEVEL_OR -gt 0 ]]
    then
    echo $(ko) "La branche 'devel' n'est pas à jour avec le repo Github d'origine"
    exit 1
fi
if [[ $RSLT_DEVEL_UP -gt 0 ]]
    then
    echo $(ko) "La branche 'devel' n'est pas à jour avec le repo Github upstream"
    exit 1
fi
if [[ $RSLT_MAIN_OR -gt 0 ]]
    then
    echo $(ko) "La branche 'main' n'est pas à jour avec le repo Github d'origine"
    exit 1
fi
if [[ $RSLT_MAIN_UP -gt 0 ]]
    then
    echo $(ko) "La branche 'main' n'est pas à jour avec le repo Github upstream"
    exit 1
fi
if [[ $RSLT_DEVEL_DEVEL -gt 0 ]]
    then
    echo $(ko) "Les branches 'devel' ne sont pas identiques sur les repo Github d'origine et upstream"
    exit 1
fi
if [[ $RSLT_MAIN_MAIN -gt 0 ]]
    then
    echo $(ko) "Les branches 'main' ne sont pas identiques sur les repo Github d'origine et upstream"
    exit 1
fi

echo $(ok) "Exercice 8 terminé"
exit 0
