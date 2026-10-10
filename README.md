# TP2DevOps

# Apprentissages

## Titre d'exo
#### Exo1 : Conteneuriser l'application guestbook
L'objectif est de conteneuriser une application Go existante pour qu'elle puisse s'exécuter dans un environnement isolé et reproductible.

#### Exo2 : Ajouter une base de données à votre service
Le but est de connecter l'application à un service de stockage de données pour que le guestbook puisse réellement enregistrer des messages.

#### Exo3: Ajouter de la persistance et du hot-reloading au guestbook
Améliorer l'expérience de développement en évitant de perdre les données et en voyant les changements de code instantanément.

#### Exo4 : Créer des stacks avec du hot-reloading 
Appliquer les concepts de conteneurisation et de hot-reloading sur un environnement technologique différent. J'ai choisi le Node.js

### Problème rencontré et pourquoi il est survenu
### Exo1
L'image de base golang:1.27.1 est très complète mais lourde: 1.04 GB. En essayant d'optimiser avec un build multi-étapes vers une image scratch ou alpine, j'ai rencontré l'erreur : "exec: /docker-gs-ping: no such file or directory".

#### Exo2
L'application affichait "No database connection". Pour que deux conteneurs communiquent, ils doivent être sur le même réseau et l'application doit connaître l'adresse de la base de données.

#### Exo4
Gérer les conflits de ports si l'application Go tourne déjà sur le port 3000

### Solution appliquée et pourquoi cette solution fonctionne
#### Exo1
J'ai utilisé une image debian pour l'étape finale du Dockerfile. Cela permet de conserver les dépendances système nécessaires au binaire tout en ramenant la taille de l'image à environ 155.83 MB 

#### Exo2
Utilisation de Docker Compose pour définir un service redis en plus du guestbook. J'ai configuré la variable d'environnement REDIS_HOST=redis. Docker Compose crée un réseau DNS interne où le nom du service devient l'adresse IP du conteneur.

#### Exo4
Configuration du port externe sur 3001 dans Docker Compose pour éviter le conflit avec le port 3000 de Go

### Ce que j'ai appris
#### Exo1
- Syntaxe Dockerfile : WORKDIR, COPY, RUN, CMD
- Différence entre le multi-staging et le single-stage

#### Exo2
- Orchestration avec docker-compose.yaml
- Utiliser les noms de services comme hostnames
- Utilisation des variables d'environnement pour la configuration

#### Exo3
- Faire en sorte que les données soient persistantes
- Eviter de reconstruire l'image Docker à chaque fois en faisant du hot-reloading

#### Exo4
- Transversalité des concepts Docker : les volumes et le mapping de ports fonctionnent de la même manière quel que soit le langage.
- Utilisation de package.json pour piloter le démarrage du conteneur.
- Gestion des conflits de ports entre plusieurs stacks locales.

Sources : 
https://docs.docker.com/compose/gettingstarted/
https://docs.docker.com/guides/golang/
https://docs.docker.com/reference/dockerfile
https://oneuptime.com/blog/post/2026-01-07-go-hot-reloading-docker-air/view
https://github.com/air-verse/air/blob/master/air_example.toml