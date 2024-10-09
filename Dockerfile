FROM httpd:2.4

# Description
LABEL Description="Dockerfile to containerize an apache app"

# copy the app + dependencies inside the container
COPY app/  /usr/local/apache2/htdocs/

# Port on which the container will listening on 
EXPOSE 80
