FROM node:13.14-alpine

RUN groupadd -r myapp && useradd -r -g myapp myapp

# Set working directory
WORKDIR /app

# Add package.json to WORKDIR and install dependencies
COPY package*.json ./
RUN npm install

# Add source code files to WORKDIR
COPY --chown=myapp:myapp . .

USER myapp

# Application port (optional)
EXPOSE 3000

HEALTHCHECK CMD curl --fail http://localhost:3000/healthz || exit 1

# Container start command (DO NOT CHANGE and see note below)
CMD ["npm", "start"]
