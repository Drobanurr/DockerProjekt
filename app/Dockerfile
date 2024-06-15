# Verwende ein Node.js-Image
FROM node:14

# Setze das Arbeitsverzeichnis
WORKDIR /App

# Kopiere die package.json und package-lock.json
COPY package*.json ./

# Installiere die Abhängigkeiten
RUN npm install

# Kopiere den Rest der Anwendung
COPY . .

# Starte die Anwendung
CMD ["node", "app.js"]
