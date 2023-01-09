# Git & Github
### Global

```bash
# Identity Name
git config --global user.name "your_name"

# Identity Email
git config --global user.email "your_addr_email"

# Editor Tool
git config --global core.editor editeur_prefere

# Diff Tool
git config --global merge.tool outils_de_merge
git mergetool --tool-help # pour avoir la liste des mergetool
```

### Branch

#### Gestion des branches

```bash
git branch -a # liste les branches

git branch nom_de_la_nouvelle_branche # crée une nouvelle branche

git checkout [nom_de_la_branche] # pour changer de branche [option -b pour créer et changer de branche]
git switch nom_de_ma_branch

```
#### Merge and rebase

```bash
# Se mettre sur la branche de destination
git switch branche_de_destination
# Puis 
git merge nom_de_la_branche_a_rapatrier # ajoute les commits qui suivent depuis une branche locale ou un fetch qui précèdait
git pull upstream nom_de_la_branche_a_rapatrier # dans le cas où on veut fetch + merge depuis une branche distante
# ou
git rebase nom_de_la_branche_a_rapatrier # réécris l'historique de cette branche (ce qu'on veut pour mettre à jour une branche à partir d'une autre branche sur laquelle on souhaite ajouter nos nouvelles fonctionnalités)
git pull --rebase upstream nom_de_la_branche_a_rapatrier # dans le cas où on veut fetch + merge depuis une branche distante

git reset --hard HEAD # annuler le merge en revennant au dernier commit valid

# sources merge vs rebase :
# https://codeur-pro.fr/difference-entre-git-fetch-et-git-pull/
# https://stackoverflow.com/questions/3357122/what-is-the-difference-between-git-pull-and-git-fetch-git-rebase
# https://coderwall.com/p/7aymfa/please-oh-please-use-git-pull-rebase
# https://www.atlassian.com/fr/git/tutorials/merging-vs-rebasing
```
```bash
# How to rebase when conflict
git am --show-current-patch # to see the failed patch
# Résoudre les conflits puis
git add/rm <conflicted_files>
git rebase --continue
# ou
git rebase --skip # sauter le commit en question
# ou
git rebase --abort # pour annuler le rebase et revenir à l'état avant le rebase
```
#### Outils (très) pratiques

```bash
git status # donne le status de votre branche
git log # pour voir l'historique des commits
git log --graph --oneline --all # voir l'arborescence du répertoire avec les branches et les commits
git reflog # pour voir l'historique des modifications des références
```
### Commit

#### Nouveau commit

```bash
git add [files]
git commit -m "message du commit"
```

#### Modifier un commit non push

```bash
git restore nom_de_la_branche # restore les modification si le commit n'a pas été push (git version < 2.23 : git checkout nom_du_fichier )

git reset [commit] # retire le commit mais conserve les modification faite dans le fichier

git reset --hard [commit] # annule le commit et les changements liés

git commit --amend -m "Le nouveau commentaire" # modifier le message du dernier commit
GIT_AUTHOR_DATE="2015-12-12 08:32 +100" git commit -m "Commit antidaté" # pour antidater un commit
git commit --author "Prénom Nom <email@address.com>" # pour commit sous une identité particulière
```
#### Stash

```bash
# use git stash to save temporaly modification in your branch (it is not a commit) before doing other tasks even on the branch (e.g. merging or rebasing the branch with the distant one to take into account previous modification from others or commit new modifications)
git stash # stash modification from added files and tracked but not new files and not ignore files (for the last two, use git add before the stash or -u in git stash cmd)

# To reapply the modification on the merge or rebase branch
git stash pop # apply the modifications and pop
# or
git stash apply  # allow to apply modifications stashed in multiple branch 

# source and other stash fonctionnalities (multiple stash, brach from stash, partial stash ):
# https://www.atlassian.com/fr/git/tutorials/saving-changes/git-stash
```

####  Squash

```bash
git rebase -i HEAD~[nombre_de_commit_precedent_à_squash] # pour concatener plusieurs commit ensemble (par exemple en vue de faire un pull-request avec )
# ouvre une session interactive, remplacer pick par squash les commits à squasher, enregistrer puis ecrite un message de commit

```



### Travailler avec un répertoire public/partagé et un fork 

#### Initialisation

```bash
# Fork le répertoire sur Github par exemple
# Cloner le répertoire qui a été fork
git clone forked_repo

# ajouter une remote vers le répertoire initial qui a été fork
git remote add upstream URL
```

#### Mettre à jour son répertoire  

```bash
git pull --rebase upstream main # met à jour le répertoire distant sur ma branche main le rebase est pour garder un historique linéaire sur mon répertoire
# /!\ NE JAMAIS FAIRE DE REBASE SUR LA BRANCHE PUBLIQUE

# Mettre à jour ses autres branches avec rebase
# Voir Merge and Rebase pour la gestion de conflit et des sources interressantes
```

#### Travailler sur son répertoire personnel

```bash
# Ne pas oublier de se mettre à jour régulièrement
# Penser à garder sa branche main à jour et fonctionnelle. Y incorporer les fonctionnalités développé sur les autres branches une fois que celles-ci sont fonctionnelles. Penser à squash les commit si besoin / ATTENTION à ne pas abuser du rebase pour ne pas perdre l'historique du répertoire publique
```

#### Demander à ajouter ses fonctionnalités

```bash
# Faire un Pull Request pour demander à merger sur la branche publique.
```

#### Accepter une Pull Request

```bash
# Si vous ètes le gérant du répertoire public/partagé il est préférable de faire des MERGE lors des pull request (mais les autres options sont possibles tout de même à étudier au cas par cas). Dans tous les cas ATTENTION le rebase modifie l'historique et pourra poser des problèmes pour tous les collaborateurs qui travaillent sur un fork de votre repo
```

