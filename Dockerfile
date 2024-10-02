FROM ubuntu

# Description
LABEL Description="Dockerfile to containerize an apache app"

# Update all packages
RUN apt-get update

# Install apache on the container 
RUN apt-get install httpd

# copy the app + dependencies inside the container
COPY index.html /var/www/html

# Port on which the container will listening on 
EXPOSE 80

# systemctl start/enable httpd
ENTRYPOINT [ "/usr/sbin/httpd" ]

# Run the container in background
CMD [ "-D", "FOREGROUND" ] 
