Exercice 2
===

### Objectifs
--- 

* **GIT**: Fork et configuration du repo local

---	
### Consignes


* **[PO]** 

	1. Fork du repo du *Git Master*
	
	2. Cloner sur le pc le repo forké.
		
			$ git clone https://github.com/XXX
		
	3. Parametrer le git remote `upstream` en mettant l'url du repo *Git* du **GM**
	
			$ cd TP-GIT-TAIGA/
			$ git remote get-url origin
			$ git remote add upstream https://github.com/XXX
			$ git remote get-url upstream
			
	4. Vérifier l'exercice.

			$ ../TP-IS3A-GIT-TAIGA/Ex02/verif_exo2.sh
	
	5. Le *Sprint1* doit être normalement clos
