FROM maven AS builder
WORKDIR /app
COPY pom.xml .
COPY /src /app/src
RUN mvn clean package

FROM maven:3.9.16-eclipse-temurin-17
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV CART_ENDPOINT="cart:8080" \
    DB_HOST="mysql"
WORKDIR /app
COPY --from=builder --chown=roboshop:roboshop /app/target/shipping-1.0.jar /app/shipping.jar
USER roboshop
CMD ["java","-jar","shipping.jar"]  

# FROM maven
# WORKDIR /app
# COPY pom.xml .
# COPY /src /app/src
# RUN mvn clean package
# RUN mv /app/target/shipping-1.0.jar /app/shipping.jar
# ENV CART_ENDPOINT="cart:8080" \
#     DB_HOST="mysql"
# CMD ["java","-jar","shipping.jar"]  

