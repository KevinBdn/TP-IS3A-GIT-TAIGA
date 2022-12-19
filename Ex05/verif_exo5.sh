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


GIT_UPSTREAM_URL=$(cat README.md | grep -i "Git-url" | sed 's/.*(\(.*\))/\1/')
MEMBER_URL_UPSTREAM_MAIN=$(echo $GIT_UPSTREAM_URL | sed 's/github/raw.githubusercontent/g')/main/Team/Members.md
GIT_ORIGIN_URL=$(git remote get-url origin)
MEMBER_URL_ORIGIN_MAIN=$(echo $GIT_ORIGIN_URL | sed 's/github/raw.githubusercontent/g')/main/Team/Members.md
wget -q $MEMBER_URL_UPSTREAM_MAIN -O /tmp/outMainUp
wget -q $MEMBER_URL_ORIGIN_MAIN -O /tmp/outMainOr
git checkout main
diff -q Team/Members.md /tmp/outMainUp
RSLT_MAIN_UP=$?
diff -q Team/Members.md /tmp/outMainOr
RSLT_MAIN_OR=$?
NUM_OF_MEMBERS=$(wc -l Team/Members.md | awk {'printf $1'})

if [[ $NUM_OF_MEMBERS -lt 2 ]]
then
    echo $(ko) "Le fichier 'Members.md' n'a pas été bien rempli"
    exit 1
fi
if [[ $RSLT_MAIN_OR -gt 0 ]]
    then
    echo $(ko) "La branche 'main' n'est pas à jour sur le repo Github d'origine"
    exit 1
fi

if [[ $RSLT_MAIN_UP -gt 0 ]]
    then
    echo $(ko) "La branche 'main' est différente sur le repo Github d'origine et celui de l'upstream"
    exit 1
fi

echo $(ok) "Exercice 5 terminé"
exit 0
