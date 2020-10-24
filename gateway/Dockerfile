FROM nginx:alpine

# Add Timezone since it cannot be done in an interactive way
#ENV TZ=UTC
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./config/nginx.conf /etc/nginx/nginx.conf

COPY ./certs /etc/ssl/certs

CMD [ "nginx-debug", "-g", "daemon off;" ]