# Use an official Node.js runtime as a base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install --omit=dev  # Ensure production dependencies are installed

# Copy the script files
COPY index.js .

# Define the entry point
ENTRYPOINT ["node", "index.js"]
