FROM nginx:1.17.8
WORKDIR /usr/share/nginx/html
COPY index.html /usr/share/nginx/html
