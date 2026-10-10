# TP2DevOps

# Apprentissages

## Titre d'exo
#### Exo1 : Conteneuriser l'application guestbook
L'objectif est de conteneuriser une application Go existante pour qu'elle puisse s'exécuter dans un environnement isolé et reproductible.

#### Exo2 : Ajouter une base de données à votre service
Le but est de connecter l'application à un service de stockage de données pour que le guestbook puisse réellement enregistrer des messages.

#### Exo3: Ajouter de la persistance et du hot-reloading au guestbook
Améliorer l'expérience de développement en évitant de perdre les données et en voyant les changements de code instantanément.

### Problème rencontré et pourquoi il est survenu
### Exo1
L'image de base golang:1.27.1 est très complète mais lourde: 1.04 GB. En essayant d'optimiser avec un build multi-étapes vers une image scratch ou alpine, j'ai rencontré l'erreur : "exec: /docker-gs-ping: no such file or directory".

#### Exo2
L'application affichait "No database connection". Pour que deux conteneurs communiquent, ils doivent être sur le même réseau et l'application doit connaître l'adresse de la base de données.

### Solution appliquée et pourquoi cette solution fonctionne
#### Exo1
J'ai utilisé une image debian pour l'étape finale du Dockerfile. Cela permet de conserver les dépendances système nécessaires au binaire tout en ramenant la taille de l'image à environ 155.83 MB 

#### Exo2
Utilisation de Docker Compose pour définir un service redis en plus du guestbook. J'ai configuré la variable d'environnement REDIS_HOST=redis. Docker Compose crée un réseau DNS interne où le nom du service devient l'adresse IP du conteneur.


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
