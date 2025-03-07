FROM node:12-alpine

# Set working directory
WORKDIR /action

# Copy package.json and install dependencies
RUN npm install @actions/core
COPY package.json ./
RUN npm install

# Copy the rest of the action's code
COPY . .

# Command to run the action
ENTRYPOINT ["node", "index.js"]

