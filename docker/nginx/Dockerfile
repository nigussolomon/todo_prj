FROM nginx:latest

RUN rm /usr/share/nginx/html/*
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
