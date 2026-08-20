FROM node:22-alpine
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop 
WORKDIR /app
RUN chown -R roboshop:roboshop /app
COPY package.json .
COPY *.js .
RUN npm install
ENV MONGO=true \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
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