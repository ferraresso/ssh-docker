FROM debian:latest

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

ARG ROOT_PASSWORD
RUN echo "root:${ROOT_PASSWORD}" | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 2222

CMD ["/usr/sbin/sshd", "-D"]
