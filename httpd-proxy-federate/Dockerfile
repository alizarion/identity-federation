FROM alizarion/httpd:latest

ADD mod_openid_conf.template /tmp/
ADD entrypoint.sh /
RUN export http_proxy=http://10.1.100.150:3128
RUN export https_proxy=http://10.1.100.150:3128
ENV http_proxy http://10.1.100.150:3128
ENV https_proxy http://10.1.100.150:3128
RUN chmod +x /entrypoint.sh

RUN rm -f /etc/httpd/conf.d/welcome.conf
RUN rm -f /usr/share/httpd/noindex/index.html
ADD index.html /usr/share/httpd/noindex/
RUN chmod 777 /usr/share/httpd/noindex/index.html

RUN curl -o /etc/yum.repos.d/security:shibboleth.repo http://download.opensuse.org/repositories/security://shibboleth/CentOS_7/security:shibboleth.repo

RUN yum -y install shibboleth

RUN rm -f /etc/httpd/conf.d/shib.conf

ADD shib.conf /etc/httpd/conf.d/
ADD shibboleth2.xml /etc/shibboleth/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["httpd-foreground"]
