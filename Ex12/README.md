Exercice 12
===

### Objectifs
---

* **GIT**: Utiliser la commande *amend*, Regrouper ses commits

  

---
### Consignes


* **[PO/GM]** : amend

  1. Se positionner sur la branche *devel*
  
     ```bash
     git checkout devel
     ```
  
	2. Supprimer les lignes pour contribuer à ce projer du fichier README.md  
  
	   ```bash
	   nano README.md
	    ...
     ```
  
  3. Faire un commit
	
     ```bash
     git commit -m "Suprepssion de contribuer à ce projtes" # noter ici les fautes d'ortographe sont voulues, on la corrigera ensuite
     ```
  
     > Avec git, on peut **modifier facilement** *(ajouter un ou plusiers fichiers ou changer le message)* le dernier commit tant qu'il n'est pas push sur le répertoire en ligne
  
  4. Ajouter le fichier consigne.txt  au commit précédent et modifier le message
  
     ```bash
     # copier coller le fichier consigne.txt dans votre répertoire
     git add contribuer.txt
     git commit -amend
     # modifier le message et voir le fichier ajouté puis enregistrer
     ```
  
  
  
- **[PO/GM]** : Regrouper plusieurs commit en un seul
  

  1. Ajouter : " 4. Intégrer votre branche devel à votre branche main (qui devra être à jour vis à vis du répertoire upstream)" dans *contribuer.txt* et faire un commit du changement
	
	   ```bash
	   nano contribuer.txt
	   	...
     git add contribuer.txt
     git commit -m "ajout de l'étape 4 dans contribuer .txt"
     ```
  
     
  
  2. Ajouter : "5. Une fois les conflits résolus, faire une Pull-request" dans *contribuer.txt* et faire un commit du changement
  
     ```bash
     nano contribuer.txt
        	...
        git add contribuer.txt
        git commit -m "ajout de l'étape 5 dans contribuer .txt" 
     ```
  
  3. Regarder les log
  
     ```bash
     git log --oneline
     ```
  
   4. On souhaite regrouper ces deux dernier commit dans le commit d'avant car ils font partis de la même fonctionnalité
  
      ```bash
      git rebase -i HEAD~3 # -i permet d'avoir le rebase en mode interactif depuis HEAD jusqu'à ici 3 commit en arrière
      # Remplacer *pick* par *squash* pour les deux commit précédent. 
      # Enregister le fichier. Un nouveau fichier de commit va s'ouvrir
      # Ajouter le message puis enregistrer
      ```
  
   5. Regarder les logs maintenant
  
      ```bash
      git log --oneline
      ```
  
      
  
- ## A retenir 

  > La commande **git commit --amend** permet de modifier le dernier commit (ajouter un ou plusiers fichiers ou changer le message) s'il n'est pas push sur le répertoire distant
  
  > la commande **git rebase -i [HEAD~3]** permet d'avoir la possibilité de réécrire une partie de l'historique. Utile pour regrouper des commits ensembles. Squash permet de fusionner le commit avec celui au dessus.
