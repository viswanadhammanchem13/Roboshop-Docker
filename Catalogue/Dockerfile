FROM node:22-alpine AS builder
WORKDIR /app
COPY package.json .
COPY *.js .
RUN npm install


FROM node:22-alpine
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV MONGO=true \
    MONGO_URL="mongodb://mongodb:27017/catalogue" 
WORKDIR /app
COPY --from=builder /app /app
USER roboshop    
CMD ["node","server.js"]    


# FROM node:20
# WORKDIR /app
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV MONGO=true \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# CMD ["node","server.js"]    