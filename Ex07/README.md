Exercice 7
===

### Objectifs
--- 

* **GIT**: Ajouter `.gitignore`

---	
### Consignes

* **[PO]**

	1. Créer le *Sprint4*
	
	2. Créer les *US* de l'exercice, les tâches asssociées et les attribuer.
	
	3. A l'issu de l'exercice le *Sprint4* doit être clos

* **[PO/GM]** 

	1. Lancer le script `init_exo7.sh`

			$ ../TP-IS3A-GIT-TAIGA/Ex07/init_exo7.sh

	2. Ajouter au `.gitignore` le dossier `tmp` généré et tous les fichiers `.pyd`.

			$ git checkout devel
			$ vi .gitignore
				| tmp/
				|*.pyd
			$ git add .gitignore
			$ git commit -m ".gitignore added"
			$ git push
			$ git checkout main
			$ git pull origin devel
			$ git push
			
	3. Pull Request + acceptation. Gérer les conflits si nécessaire.

	4. Vérifier l'exercice
		
			$ ../TP-IS3A-GIT-TAIGA/Ex07/verif_exo7.sh
