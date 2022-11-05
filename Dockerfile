FROM centos

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
MAINTAINER baddikhalid54@gmail.com
RUN yum install httpd -y \
  zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page283/ninom.zip /var/www/html
WORKDIR /var/www/html
RUN unzip ninom.zip
RUN cp -rvf ninom-html/* .
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
