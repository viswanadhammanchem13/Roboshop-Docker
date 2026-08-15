FROM python:3.9
#EXPOSE 8080
WORKDIR /app
COPY requirements.txt .
COPY *.py .
COPY payment.ini .
RUN pip install -r requirements.txt 
ENV CART_HOST="cart" \
    CART_PORT="8080" \
    USER_HOST="user" \
    USER_PORT="8080" \
    AMQP_HOST="rabbitmq"
CMD ["uwsgi","--ini","payment.ini"]