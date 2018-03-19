# @package  Personal ISP Containers
# @asset    HAProxy
# @author   http://bitbucket.org/ceth

FROM debian:latest

RUN apt-get update -qqy --fix-missing --allow-unauthenticated
RUN apt-get install -qqy rsyslog haproxy

RUN mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.old
COPY conf/haproxy.cfg /etc/haproxy/haproxy.cfg

RUN rm /etc/rsyslog.d/49-haproxy.conf
COPY conf/49-haproxy.conf /etc/rsyslog.d/49-haproxy.conf

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

RUN mkdir -p /run/haproxy

EXPOSE 80 1936 
VOLUME /srv/conf

CMD ["/usr/local/bin/start.sh"]
