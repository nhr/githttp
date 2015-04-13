FROM fedora:21
MAINTAINER N. Harrison Ripps <nhr@redhat.com>
RUN yum install -y git httpd
ADD git.conf /etc/httpd/conf.d/
RUN mkdir /var/www/git && chmod 777 /var/www/git
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND", "-E", "/var/log/httpd/error_log"]
EXPOSE 80
