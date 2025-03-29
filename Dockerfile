#cambio para probar trigger
# Usar la imagen base oficial de Node.js
FROM node:14

# Establecer el directorio de trabajo
WORKDIR /usr/src/app

# Copiar los archivos package.json y package-lock.json
COPY package*.json ./

# Instalar dependencias
RUN npm install --legacy-peer-deps

# Copiar el código de la aplicación
COPY . .

# Exponer el puerto en el que corre la aplicación
EXPOSE 80

# Ejecutar la aplicación
CMD ["npm", "start"]
