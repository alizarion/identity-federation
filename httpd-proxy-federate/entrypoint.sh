#!/bin/bash
set -e

if [ -z "$OIDCProviderMetadataURL" -a -z "$OIDCClientID" -a -z "$OIDCClientSecret" -a -z "$OIDCRedirectURI" ]; then
        echo >&1 'ERROR  Did you forget to add one of these -e OIDCProviderMetadataURL=... -e OIDCClientID=...-eOIDCClientSecret=.. -e OIDCRedirectURI=.. ?'
        exit 1
fi
if [ -z "$SAMLMetadataURL" -a -z "$SAMLClientID" -a -z "$SAMLEntityID" ]; then
        echo >&1 'ERROR  Did you forget to add one of these -e SAMLMetadataURL=... -e SAMLClientID=...-e SAMLEntityID=.. ?'
        exit 1
fi

sed -e "s;%OIDCProviderMetadataURL%;$OIDCProviderMetadataURL;g" -e "s;%OIDCClientID%;$OIDCClientID;g" -e "s;%OIDCClientSecret%;$OIDCClientSecret;g" -e "s;%OIDCRedirectURI%;$OIDCRedirectURI;g" /tmp/mod_openid_conf.template > /etc/httpd/conf.d/openidc.conf
sed -e "s;%SAMLMetadataURL%;$SAMLMetadataURL;g" -e "s;%SAMLClientID%;$SAMLClientID;g" -e "s;%SAMLEntityID%;$SAMLEntityID;g" /tmp/shibboleth2_xml.template > /etc/shibboleth/shibboleth2.xml

exec "$@"
