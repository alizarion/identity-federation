
FROM alizarion/httpd:latest

ADD mod_openid_conf.template /tmp/
ADD entrypoint.sh /

RUN rm -f /etc/httpd/conf.d/welcome.conf

ENTRYPOINT ["/entrypoint.sh"]

CMD ["httpd-foreground"]
