# FROM maven
# WORKDIR /app
# COPY pom.xml .
# COPY /src .
# RUN mvn clean package
# RUN mv /app/target/shipping-1.0.jar /app/shipping.jar
# ENV CART_ENDPOINT="cart:8080" \
#     DB_HOST="mysql"
# CMD ["java","-jar","shipping.jar"]  

FROM almalinux:10
WORKDIR /app
COPY pom.xml .
COPY /src /app/src
CMD ["sleep","1000"]