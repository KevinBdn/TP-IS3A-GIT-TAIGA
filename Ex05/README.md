Exercice 5
===

### Objectifs
--- 

* **GIT**: Résoudre un conflit, faire une *Pull-Request*

---	
### Consignes

Il y a conflit sur le fichier `Members.md`.
Le mieux est de gérer le conflit avant de faire une *Pull-Request*

* **[PO]** 

	1. Créer le `Sprint3`
	
	2. Créer les *US* des exercices 3 et 4, les tâches asssociées et les attribuer
	
	2. Sur la branche `devel` résoudre le conflit

			$ git checkout devel
			$ git pull upstream main
			
			# Conflit à gérer dans le fichier `Members.md`
			
			$ git add Teams/Members.md
			$ git commit -m "Members.md updated avoiding conflicts"
			$ git push origin devel

	2. Branch `main` à mettre à jour à partir de la branche `devel`

			$ git checkout main
			$ git pull origin devel
			$ git push origin main

	3. Faire pull-request depuis Github `main` **PO** vers `main` **GM**
		
		
	4. Vérifier l'exercice
	
			$ ../TP-IS3A-GIT-TAIGA/Ex05/verif_exo5.sh
