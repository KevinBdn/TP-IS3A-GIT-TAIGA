Exercice 4
===

### Objectifs
--- 

* **GIT**: Fusionner une branche

---	
### Consignes

* **[PO & GM]** 

	1. Fusionner la branche `devel` sur `main` et la pusher
	
			$ git checkout main
			# Mise à jour depuis le repo distant
			$ git pull origin devel
			# Ou mise à jour depuis le repo local
			$ git merge devel
			$ git push origin main
	
	2. Vérifier l'exercice
		
			$ ../TP-IS3A-GIT-TAIGA/Ex04/verif_exo4.sh
				
	3. Le *Sprint2* doit être clos
