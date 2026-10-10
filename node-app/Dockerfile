FROM node:18-alpine

WORKDIR /app

#copie les fichiers de dépendances
COPY package*.json ./

# installe les dépendances
RUN npm install

# copie le reste du code
COPY . .

EXPOSE 3000

#lance le script "dev" de package.json
CMD ["npm", "run", "dev"]