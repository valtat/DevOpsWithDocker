# ./frontend/Dockerfile

# Use official Node.js runtime as a parent image
FROM node:20.11.1-alpine3.19

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies and remove unnecessary files
RUN npm ci

# Copy the rest of the code to the working directory
COPY . .

# Define the command to run the app
CMD [ "npm", "run", "docker" ]