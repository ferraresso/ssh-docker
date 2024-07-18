FROM debian:latest

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
ARG ROOT_PASSWORD
RUN echo "the pass is: ${ROOT_PASSWORD}"
RUN echo "root:${ROOT_PASSWORD}" | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D"]
