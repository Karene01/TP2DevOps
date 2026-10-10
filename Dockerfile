# syntax=docker/dockerfile:1

FROM golang:1.27.1
# création du répertoire de travail 
WORKDIR /app

#installation de Air
RUN go install github.com/air-verse/air@latest

# copie des fichiers de dépendances
COPY go.mod go.sum ./

# les modules go sont installés dans l'image
RUN go mod download

COPY . .

#lancer air
CMD ["air", "-c", ".air.toml"]