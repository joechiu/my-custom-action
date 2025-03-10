FROM node:12-alpine

# Set working directory
WORKDIR /action

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the action's code
COPY . .
RUN npm install @actions/core -g
RUN npm install @actions/core 
RUN export NODE_PATH=$(npm root --quiet -g)

# Command to run the action
ENTRYPOINT ["node", "index.js"]

