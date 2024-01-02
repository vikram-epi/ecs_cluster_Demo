 # syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 node:12-alpine
 WORKDIR /app
 COPY . .
 RUN yarn install --production
 EXPOSE 80
 CMD ["node", "index.js"]
