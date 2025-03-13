# Use an official Node.js runtime as a base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package files first
COPY package.json package-lock.json ./

# Install dependencies (force full installation)
RUN npm ci --omit=dev || npm install --omit=dev

# Copy the rest of the files
COPY index.js .

# Define the entry point
ENTRYPOINT ["node", "index.js"]
