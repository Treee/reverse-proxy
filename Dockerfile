FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
# COPY nginx.conf /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
