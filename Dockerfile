# Use an official Node.js runtime as a base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies (force full installation)
RUN npm ci --omit=dev  # This ensures dependencies are installed exactly as in package-lock.json
npm uninstall @actions/core@^1.11.1

# Copy the rest of the files
COPY index.js .

# Define the entry point
ENTRYPOINT ["node", "index.js"]
