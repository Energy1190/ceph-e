FROM ceph/base

RUN apt-get update && apt-get -y install runit && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./tpl.confd /app
ADD my_init/my_init /sbin/my_init
ADD ./bin/boot /etc/service/bootstrap/run
ADD 2.sh /etc/runit/2
 
RUN mkdir -p /etc/container_environment /etc/service/bootstrap && \
chmod +x /etc/runit/2 /sbin/my_init /etc/service/bootstrap/run

CMD ["/sbin/my_init"]
