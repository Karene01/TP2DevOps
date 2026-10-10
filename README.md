# TP2DevOps

# Apprentissages

## Titre d'exo
#### Exo1 : Conteneuriser l'application guestbook
L'objectif est de conteneuriser une application Go existante pour qu'elle puisse s'exécuter dans un environnement isolé et reproductible.

### Problème rencontré et pourquoi il est survenu
### Exo1
L'image de base golang:1.27.1 est très complète mais lourde: 1.04 GB. En essayant d'optimiser avec un build multi-étapes vers une image scratch ou alpine, j'ai rencontré l'erreur : "exec: /docker-gs-ping: no such file or directory".

### Solution appliquée et pourquoi cette solution fonctionne
#### Exo1
J'ai utilisé une image debian pour l'étape finale du Dockerfile. Cela permet de conserver les dépendances système nécessaires au binaire tout en ramenant la taille de l'image à environ 155.83 MB 
### Ce que j'ai appris
#### Exo1
- Syntaxe Dockerfile : WORKDIR, COPY, RUN, CMD
- Différence entre le multi-staging et le single-stage
