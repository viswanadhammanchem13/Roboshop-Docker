FROM nginx
EXPOSE 80
RUN rm -rf /usr/share/nginx/html/index.html
RUN rm -rf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/default.conf
ADD Static /usr/share/nginx/html/
ADD nginx.conf /etc/nginx/nginx.conf
