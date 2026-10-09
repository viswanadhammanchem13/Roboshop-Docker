FROM python:3.10-alpine3.20 AS builder
WORKDIR /build
RUN apk add --no-cache python3-dev build-base linux-headers pcre-dev
COPY requirements.txt .
RUN pip3 install --no-cache-dir  --prefix=/install -r requirements.txt 

FROM python:3.10-alpine3.20
EXPOSE 8080
WORKDIR /app
ENV CART_HOST="cart" \
    CART_PORT="8080" \
    USER_HOST="user" \
    USER_PORT="8080" \
    AMQP_HOST="rabbitmq" \
    AMQP_USER=roboshop \
    AMQP_PASS=roboshop123
RUN apk add --no-cache pcre
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
USER roboshop
COPY --from=builder /install /usr/local
COPY --chown=roboshop:roboshop payment.ini .
COPY --chown=roboshop:roboshop *.py .
CMD ["uwsgi","--ini","payment.ini"]

# FROM python:3.9
# EXPOSE 8080
# WORKDIR /app
# COPY requirements.txt .
# COPY *.py .
# COPY payment.ini .
# RUN pip install -r requirements.txt 
# ENV CART_HOST="cart" \
#     CART_PORT="8080" \
#     USER_HOST="user" \
#     USER_PORT="8080" \
#     AMQP_HOST="rabbitmq" \
#     AMQP_USER=roboshop \
#     AMQP_PASS=roboshop123
# CMD ["uwsgi","--ini","payment.ini"]