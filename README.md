TP-IS3A-GIT-TAIGA
====

Ce TP a pour objectifs d'apprendre les bonnes pratiques **Git** ainsi que de prendre en main l'outil **TAIGA** en vue du projet de l'UV 5.8.  

### Consignes 
---

Il est composé de 10 mini-exercices. Les exercices se font par groupe de deux (ou trois si nombre d'élèves impair).  
Dans chaque groupe un *Git master* (**GM**) et un (ou deux si groupe de trois) *Product Owner* (**PO**) doivent être définis. Le **PO** a pour rôle de gérer le projet **TAIGA** alors que le **GM** gérera le répertoire **Github** "maître" du projet.  
Durant le projet de l'UV 5.8, ce repertoire **Github** constitura le livrable qui sera fourni au client à chaque *Sprint*, il doit donc tout le temps être fonctionnel.


Dans les exercices les actions à réaliser peuvent être différentes pour le **PO** et le **GM**. 
Dans chaque dossier **ExXX** les consignes sont décrites dans le fichier `REAMDE.md`. Une fois l'exercice réalisé il faut lancer le script `verif_exoXX.sh` pour savoir si l'exercice a bien été réalisé. Dans le cas où un message d'erreur apparait, faites appel à un encadrant.


### Mise en place du TP
---

Lors de cet UV il vous faudra créer un compte **Github**. Vous pourrez vous connecter à **TAIGA** en utilisant ce même compte. 

Afin de démarrer le TP vous devez utiliser une machine **Ubuntu** et vous placer dans un dossier de travail. Vous pouvez ensuite cloner ce répertoire:

	$ git clone https://github.com/KevinBdn/XXXX

Dans le premier exercice vous aller créer un repertoire Github `TP-GIT-TAIGA` et le cloner sur votre machine. 

L'arborescence à l'isssu de ce premier exercice devra être la suivante:

	.
	├── TP-GIT-TAIGA 	# Votre repo
	└── TP-IS3A-GIT-TAIGA 	# Ce repo

Les fichiers `verif_exoXXX.sh` doivent être exécutés depuis votre repo local:

	$ cd TP-GIT-TAIGA
	$ ../TP-IS3A-GIT-TAIGA/ExXX/verif_exoXX.sh


### Gestion sous TAIGA du projet
---

Sous **TAIGA** 6 *Sprints* seront à créer. Chaque *Sprint* rassemble un ou plusieurs exercices. Chaque exercice à plusieurs objectifs qui sont décrits ci-dessous. Un objectif fera office de *User Story*. Pour chaque *User Story* il faudra définir les sous-tâches adaptées qui correspondent aux étapes de chaque exercice. Suivant la personne a qui ces étapes se réfère il faudra associer ces sous-tâches aux membres du projet. Chaque membre devra alors faire évoluer ses tâches afin de clore la *User Story*. 

| Sprint | Exercices | 
| - |-|
| 1 | [Ex01](Ex01/README.md), [Ex02](Ex02/README.md) | 
| 2 | [Ex03](Ex03/README.md), [Ex04](Ex04/README.md) |
| 3 | [Ex05](Ex05/README.md), [Ex06](Ex06/README.md) |
| 4 | [Ex07](Ex07/README.md) |
| 5 | [Ex08](Ex08/README.md) |
| 6 | [Ex09](Ex09/README.md), [Ex10](Ex10/README.md) |

* **SPRINT1** - Mise en place du projet

	* [Ex01](Ex01/README.md)
	
		* **[GM]** Créer et initaliser un repertoire **Github**
		* **[PO]** Créer un projet Scrum sous **TAIGA**
		* **[PO]** Ajouter un *Sprint* et les *User Stories* sous **TAIGA**
		* **[PO]** Créer des sous tâches et les attribuer aux membres
		
	* [Ex02](Ex02/README.md)
		
		* **[PO]** Forker un repo **Github** et configurer le projet en local
* **SPRINT2** - Gestion des branches et des fusions

	* [Ex03](Ex03/README.md)
	
		* **[PO & GM]** Créer une branche en local
		* **[PO & GM]** Pousser une branche sur le repo
	
	* [Ex04](Ex04/README.md)
	
		* **[PO & GM]** Fusionner des branches
* **SPRINT3** - Gestion des conflits et des *Pull Request*

	* [Ex05](Ex05/README.md)
	
		* **[PO]** Gérér un conflit
		* **[PO]** Faire une *Pull Request*
	
	* [Ex06](Ex06/README.md)
	
		* **[GM]** Accepter une *Pull Request*
* **SPRINT4** - Utilisation du `.gitignore`

	* [Ex07](Ex07/README.md)
	
		* **[PO/GM]** Créer et configurer un `.gitignore`
* **SPRINT5** - Gestion des issues

	* [Ex08](Ex08/README.md)
		
		* **[PO]** Relier **Github** à **TAIGA**
		* **[PO]** Créer une issue
		* **[GM]** Résoudre une issue
* **SPRINT6** - Création d'une branche à partir d'un *Commit*

	* [Ex09](Ex09/README.md)
	
		* **[PO & GM]** Utilisation des *tags*
		* **[PO & GM]** Création d'une branche à partir d'un *Commit*
	* [Ex10](Ex10/README.md)
	
		* **[PO & GM]** Supression d'une branche
* **SPRINT7**-Gestion de l'historique git
  * [Ex11](Ex11/README.md)
    * **[PO & GM]** Différences entre *merge* et *rebase*
  * [Ex12](Ex12/README.md)
    * **[PO & GM]** Modification du dernier *commits* et *squash*

