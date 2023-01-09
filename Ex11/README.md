Exercice 11
===

### Objectifs
---

* **GIT**: Utiliser la commande `$ git rebase`, voir la différence avec `$ git merge`, utiliser la commande `$ git reset`, `$ git log` et `$ git reflog`

---
### Consignes


* **[GM]**

    1. Se positionner sur la branche `devel`
  
            $ git checkout devel	   
  
    2. Ajouter son rôle devant son nom dans le fichier `Members.md`

		    $ nano Team/Members.md
		    ...
	
	3. Faire un commit 
	
  		    $ git commit -m "GM status added"
  
    4. Ajouter dans le `README.md` les infos si d'autres veulent contribuer

            $ nano README.md
            $ ...
            # Copier coller : 
            # Pour contribuer à ce projet :
            #            1. Fork le projet
            #            2. Créer une branche devel
            #            3. Développer vos fonctionnalités
            #            4. Intégrer votre branche devel à votre branche main (qui devra être à jour vis à vis du répertoire upstream)
            #            5. Une fois les conflits résolus, faire une Pull-request
  
    5. Faire un commit

            $ git commit -m "Instructions to contribute added"
    
    6. Mettre à jour sa branche `main` et son répertoire distant

            $ git push origin devel
            $ git checkout main
            $ git pull origin devel
            $ git push origin main
    


* **[PO]**

    1. Se mettre sur sa branche *devel*

            $ git checkout devel

  
    2. Ajouter dans le fichier `Members.md` la fonction **PO** devant son nom

           $ nano Team/Members.md
            ...
     
  
    3. Faire un commit 

            $ git commit -m "PO status added"
            $ git push origin devel 


## **Observer Merge vs Rebase**

1. Sur le répertoire du **PO** créer une nouvelle branche `test` [le **GM** est présent et observe]

        $ git branch test

2. Faire un **merge** sur la branche et résoudre les confits éventuels

       $ git checkout test
       $ git pull upstream main # fait le merge ;)
       # si besoin résoudre les conflits


3. Observer les différents log sous forme d'arbre

        $ git log --graph --oneline --all

4. Faire une capture d'écran et l'enregistrer. Lui donner un nom (ex. `picture_git_merge.png`) !

5. On souhaite maintenant revenir en arrière, avant le *rebase* 

        $ git reflog # pour récuperer la référence des opérations faites sur le répertoire
        # Identifier la référence correspondant à la dernière action avant le merge
        $ git reset --HARD <ref> # permet de revenir à <ref> en supprimant toutes les modifications qui ont été faites

6. Faire un **rebase** sur la branche et résoudre les confits éventuels

        $ git checkout test
        $ git pull --rebase upstream main
        # Se laisser guider par les informations de la commande s'il y a des conflits à résoudre

7. Observer les différents log sous forme d'arbre

        $ git log --graph --oneline --all

8. Faire une capture d'écran et  l'enregistrer. Lui donner un nom (ex. `picture_git_rebase.png`) !

9. Mettre à jour sa branche test

        $ git push origin test

10. Mettre à jour sa branche main

        $ git checkout main
        $ git pull origin test
        $ git push origin main 

11. Observer les captures d'écran : 

    Comment sont organisés les commits de la première capture d'écran (`merge`) et ceux de la deuxième (`rebase`) ?
    

## A retenir 

> La commande `merge` écrit un commit de merge au dessus des commits locaux ajoutés
>
> La commande `rebase` réécrit l'historique et réapplique ensuite les commits locaux de manière chronologique
>
> Ainsi lorsqu'on travail sur **un fork, ou sur des branches de développement**,  il convient mieux d'utiliser la commande `rebase` pour toujours garder un historique cohérent avec la branche du répertoire principal et ne pas ajouter de commit de merge
>
> En revanche sur **la branche main du répertoire principal**, au contraire il **FAUT IMPÉRATIVEMENT** utiliser la commande  *merge* pour ajouter les fonctionnalités des Pull-Request. Sinon, avec *rebase* vous réécrirez un historique complètement nouveau qui sera incompatible avec vos autres branches et autres forks ce qui compliquera **GRANDEMENT** leur participation.

> La commande `$ git log` permet de voir l'historique des **commits**
>
> La commande `$ git reflog` permet de voir l'historique des commandes
>
> La commande `$ git reset [réference]`  permet revenir en arrière à la référence choisie. Si elle est associée à `--hard` les modifications apporté aux différents éléments du fichiers seront supprimées. Sans cette option, les modifications resteront.

