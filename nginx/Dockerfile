FROM nginx
RUN apt-get update -qq && apt-get -y install apache2-utils
ENV RAILS_ROOT /var/www/rails_app
WORKDIR $RAILS_ROOT
RUN mkdir -p log
# copy nginx config template to docker_example.nginx
COPY nginx/app.conf /tmp/docker_example.nginx
# replace environment variables and write to new file
RUN envsubst '$RAILS_ROOT' < /tmp/docker_example.nginx > /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]