FROM python:3.10-alpine3.23 AS builder
WORKDIR /app
COPY requirements.txt .
COPY *.py .
COPY payment.ini .
RUN pip install -r requirements.txt 

FROM python:3.10-alpine3.23
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
WORKDIR /app
EXPOSE 8080
COPY requirements.txt .
ENV CART_HOST="cart" \
    CART_PORT="8080" \
    USER_HOST="user" \
    USER_PORT="8080" \
    AMQP_HOST="rabbitmq" \
    AMQP_USER=roboshop \
    AMQP_PASS=roboshop123
COPY --from=builder --chown=roboshop:roboshop /app /app
USER roboshop    
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