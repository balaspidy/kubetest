FROM nginx:17.1
WORKDIR /usr/share/nginx/html
COPY index.html /usr/share/nginx/html
