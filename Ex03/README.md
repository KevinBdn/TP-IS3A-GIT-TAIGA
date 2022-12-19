Exercice 3
===

### Objectifs
--- 

* **GIT**: Créer un branche, pusher une modification

---	
### Consignes

* **[PO]**

	1. Créer le `Sprint2`
	
	2. Créer les *US* des exercices 2 et 3, les tâches asssociées et les attribuer

* **[PO & GM]** 

	1. Créer branche `devel`
			
			$ git branch devel
			$ git checkout devel
	
	2. `devel`: Ajouter dans `Team/Members.md` son prénom/nom
	
	3. `devel`: Pusher sur GitHub
	
			$ git add Team/Members.md
			$ git commit -m "Members.md updated"
			$ git push origin devel
	
	4. Vérifier l'exercice
		
			$ ../TP-IS3A-GIT-TAIGA/Ex03/verif_exo3.sh
