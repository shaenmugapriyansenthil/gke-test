ARG DOCKER_GID=993
RUN groupadd -g ${DOCKER_GID} docker \
 && useradd -m -d /home/jenkins -s /bin/sh jenkins \
 && usermod -aG docker jenkins
FROM nginx:mainline-alpine
RUN rm /etc/nginx/conf.d/*
ADD hello.conf /etc/nginx/conf.d/
ADD index.html /usr/share/nginx/html/
