# Use official Node.js runtime as base image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies with --legacy-peer-deps flag
RUN npm install --legacy-peer-deps

# Copy the rest of the frontend files
COPY . .

# Expose the port the app runs on (assuming the default port for Vue is 3000)
EXPOSE 3000

# Start the app
CMD ["npm", "run", "dev"]
