# Start from a lightweight Node.js image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files to install dependencies
COPY package*.json ./

# Install dependencies (including Tailwind CLI if specified in your package.json)
RUN npm install

# Copy the rest of your app's code into the container
COPY . .

# Run Tailwind CSS CLI to build the CSS file (assuming your command is set up in package.json as "build:css")
RUN npm run build:css

# Install a lightweight HTTP server to serve the static files
RUN npm install -g serve

# Expose the port where the server will run
EXPOSE 3000

# Command to start the server
CMD ["serve", "-s", "dist", "-l", "3000"]
