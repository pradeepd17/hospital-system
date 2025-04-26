# Start from an official Node.js image
FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json if available (important for faster Docker builds)
COPY package*.json ./

# Install all Node.js dependencies
RUN npm install

# Copy the rest of the app's code into the container
COPY . .

# Expose the port the app will run on (we can dynamically pass it during run time, but let's expose both commonly used)
EXPOSE 3000
EXPOSE 3001

# Default command to run the service
# (override this while running depending which service you want)
CMD ["node", "patient-service.js"]
