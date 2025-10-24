FROM node:20-alpine

# Instala o smee-client globalmente
RUN npm install --global smee-client

# Comando padrão
ENTRYPOINT ["smee"]