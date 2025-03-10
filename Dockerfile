FROM node:12-alpine

ENV NODE_PATH=$(npm root --quiet -g)

# Set working directory
WORKDIR /action

# pre install actions
RUN npm install @actions/core -g

# Copy package.json and install dependencies
COPY package.json ./
RUN npm link "$NODE_PATH/@actions/core"
RUN npm install

# Copy the rest of the action's code
COPY . .

# Command to run the action
ENTRYPOINT ["node", "index.js"]

