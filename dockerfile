# Set the base image with the specified Node.js version
ARG NODE_VERSION=24.14.0
FROM node:${NODE_VERSION}-alpine

# Expose port 3000 for the application
EXPOSE 3000

# Set the environment variable for Node.js to run in production mode
RUN apk add --no-cache tini

# Create and set the working directory inside the container
WORKDIR /usr/src/app

#copy package.json
COPY package.json ./

# Install dependencies by leveraging Docker's caching
# Use bind mounts to package.json and package-lock.json for faster builds
RUN npm install && npm cache clean --force

# Copy all the application source files into the container
COPY . .

# Define the command to run the application
CMD ["node", "server.js"]