# Build stage
FROM node:22-alpine AS builder
WORKDIR /app
COPY package.json .
COPY *.js .
RUN npm install


FROM node:22-alpine
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV REDIS_HOST="redis" \
    CATALOGUE_HOST="catalogue" \
     MONGO_URL="mongodb://mongodb:27017/users" \
     CATALOGUE_PORT="8080"
WORKDIR /app
COPY --from=builder --chown=roboshop:roboshop /app /app
USER roboshop    
CMD ["node","server.js"] 


# FROM node:20
# WORKDIR /app
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV REDIS_HOST="redis" \
#     CATALOGUE_HOST="catalogue" \
#     MONGO_URL="mongodb://mongodb:27017/users" \
#     CATALOGUE_PORT="8080"
# CMD ["node","server.js"]  