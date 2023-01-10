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
GITIGNORE_URL_MAIN=$(echo $GIT_UPSTREAM_URL | sed 's/github/raw.githubusercontent/g')/main/.gitignore
rm -f /tmp/out
wget -q $GITIGNORE_URL_MAIN -O /tmp/out
git checkout devel
diff -q .gitignore /tmp/out
RSLT_DEVEL=$?
git checkout main
diff -q .gitignore /tmp/out
RSLT_MAIN=$?
NUM_OF_GITIGNORE=$(wc -l .gitignore | awk {'printf $1'})

if [[ -e tmp/5.txt && -e file1.pyd ]]
then
    GITIGNORE_RSLT=$(git status | grep -c "5.txt\|.pyd")
    if [ $GITIGNORE_RSLT -ne 0 ]
    then
        echo $(ko) "Le fichier '.gitignore' n'a pas été bien rempli"
        exit 1
    fi
fi

if [[ $NUM_OF_GITIGNORE -lt 2 ]]
then
    echo $(ko) "Le fichier '.gitignore' n'a pas été bien rempli"
    exit 1
fi
if [[ $RSLT_MAIN -gt 0 ]]
    then
    echo $(ko) "La branche 'main' n'est pas à jour avec le repo Github upstream"
    exit 1
fi

if [[ $RSLT_DEVEL -gt 0 ]]
    then
    echo $(ko) "La branche 'devel' n'est pas à jour avec le repo Github upstream"
    exit 1
fi

echo $(ok) "Exercice 7 terminé"
exit 0
