FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

ENV NODE_ENV=production
ENV PORT=3000
ENV MONGO_URI=mongodb://rootuser:rootpassword@host.docker.internal:27017/hr_system?authSource=rootuser
ENV DB_NAME=hr_system
ENV MONGO_USERNAME=rootuser
ENV MONGO_PASSWORD=rootpassword
ENV DEFAULT_ADMIN_ID=project
ENV DEFAULT_ADMIN_PASSWORD=project123
ENV LOG_LEVEL=info

EXPOSE 3000

CMD ["node", "server.js"]
 