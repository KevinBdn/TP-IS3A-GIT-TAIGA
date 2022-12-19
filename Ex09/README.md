Exercice 9
===

### Objectifs
--- 

* **GIT**: Utiliser un tag et créer une nouvelle branche à partir d'un commit

---	
### Consignes

* **[PO/GM]**

	1. Créer le *Sprint6*
	
	2. Créer les *US* des exercices 9 et 10, les tâches asssociées et les attribuer.


* **[PO & GM]** 

	1. Ajouter un tag au niveau du commit avant l'ajout du `.gitignore`
	
			$ git log --oneline
			$ git tag before-gitignore XXX
		
	2. Générer une nouvelle branche à partir de ce commit. Cela permet de récupérer des travaux effectués ou bien de figer une version de l'outil dans une banche.

			$ git checkout -b test before-gitignore
			
	3.  Vérifier l'exercice
		
			$ ../TP-IS3A-GIT-TAIGA/Ex09/verif_exo9.sh

