# Use an official Node.js runtime as the base image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the backend files
COPY . .

# Install TypeScript and ts-node globally
RUN npm install -g typescript ts-node

# Expose the port your app runs on
EXPOSE 5000

# Run the application
CMD ["npm", "start"]
