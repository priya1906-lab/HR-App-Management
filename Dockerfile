FROM node:18-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
RUN chown -R appuser:appgroup /app
USER appuser
EXPOSE 3000
CMD [ "npm", "start"]
