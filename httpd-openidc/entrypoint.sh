#!/bin/bash
set -e
#OIDCProviderMetadataURL="$("$@" --verbose --help 2>/dev/null | awk '$1 == "OIDCProviderMetadataURL" { print $2; exit }')"
#OIDCClientID="$("$@" --verbose --help 2>/dev/null | awk '$1 == "OIDCClientID" { print $2; exit }')"
#OIDCClientSecret="$("$@" --verbose --help 2>/dev/null | awk '$1 == "OIDCClientSecret" { print $2; exit }')"
#PORT=3323
if [ -z "$OIDCProviderMetadataURL" -a -z "$OIDCClientID" -a -z "$OIDCClientSecret" -a -z "$OIDCRedirectURI" ]; then
        echo >&1 'ERROR  Did you forget to add one of these -e OIDCProviderMetadataURL=... -e OIDCClientID=...-eOIDCClientSecret=.. -e OIDCRedirectURI=.. ?'
        exit 1
fi

rm -f /etc/httpd/conf.d/welcome.conf

sed -e "s;%OIDCProviderMetadataURL%;$OIDCProviderMetadataURL;g" -e "s;%OIDCClientID%;$OIDCClientID;g" -e "s;%OIDCClientSecret%;$OIDCClientSecret;g" -e "s;%OIDCRedirectURI%;$OIDCRedirectURI;g" /tmp/mod_openid_conf.template > /etc/httpd/conf.d/welcome.conf
