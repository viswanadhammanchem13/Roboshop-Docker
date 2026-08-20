# Build stage
FROM node:22-alpine AS builder
WORKDIR /app
COPY package.json .
COPY *.js .
RUN npm install

# Runtime stage
FROM node:22-alpine
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV MONGO=true \
    REDIS_URL='redis://redis:6379' \
   MONGO_URL="mongodb://mongodb:27017/users"
WORKDIR /app
COPY --from=builder --chown=roboshop:roboshop /app /app
USER roboshop    
CMD ["node","server.js"]    

# FROM node:20
# WORKDIR /app
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV MONGO=true \
#     REDIS_URL='redis://redis:6379' \
#     MONGO_URL="mongodb://mongodb:27017/users"
# CMD ["node","server.js"]   