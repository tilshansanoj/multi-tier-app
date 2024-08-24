# Use the official Node.js 22 Alpine image as the base image.
FROM node:22-alpine

# Set the working directory inside the container to /app.
# All subsequent commands will be run from this directory.
WORKDIR /app

# Copy package.json and package-lock.json (if it exists) into the container.
COPY package*.json ./

# Install the dependencies listed in the package.json file.
RUN npm install

# Copy the rest of the application files into the container.
COPY . .


# Expose port 3000 to allow traffic to this port.
EXPOSE 3000

# The default command to run when the container starts.
CMD [ "npm", "start" ]
