FROM alizarion/httpd:latest

ADD mod_openid_conf.template /tmp/
ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["httpd-foreground"]
