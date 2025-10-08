# Use a lightweight Node.js base image
FROM node:18-alpine
 
# Set working directory inside the container
WORKDIR /app
 
# Copy package files and install only production dependencies
COPY package*.json ./
RUN npm install --production
 
# Copy the rest of the application code
COPY . .
 
# Inject environment variables (optional — better to use .env or docker run --env-file)
ENV NODE_ENV=production
ENV PORT=3000
ENV MONGO_URI=mongodb://rootuser:rootpassword@host.docker.internal:27017/hr_system?authSource=rootuser
ENV DB_NAME=hr_system
ENV MONGO_USERNAME=rootuser
ENV MONGO_PASSWORD=rootpassword
ENV DEFAULT_ADMIN_ID=project
ENV DEFAULT_ADMIN_PASSWORD=project123
ENV LOG_LEVEL=info
 
# Expose the port your app listens on
EXPOSE 3000
 
# Start the application
CMD ["node", "server.js"]
 