FROM nginx

RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY data/nginx/nginx.conf /etc/nginx
COPY data/nginx/app.conf /etc/nginx/conf.d
