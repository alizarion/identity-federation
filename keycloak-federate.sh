#!/bin/bash
export OIDCProviderMetadataURL=http://keycloak.crossview.io/auth/realms/supplier-portal
export OIDCClientID=supplier-portal-rest-api
export OIDCClientSecret=ac080650-3773-4136-b54e-2a433418cbdd
export http_proxy=
export https_proxy=
docker-compose up
