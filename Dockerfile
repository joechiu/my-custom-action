FROM node:latest

RUN apt remove nodejs && apt autoremove
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
RUN apt update
RUN apt install nodejs -y

# Set working directory
WORKDIR /action

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the action's code
COPY . .

# Command to run the action
ENTRYPOINT ["node", "index.js"]

