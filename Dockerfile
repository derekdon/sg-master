FROM couchbase/sync-gateway:1.3.1-community

MAINTAINER Derek Donnelly, derek@codex9.com

# copy the default config into the container
COPY config/sync_gateway_config.json /etc/sync_gateway/config.json

# add env variables to sync gateway config by string replacing each <TAG>
RUN sed \
  -e 's/<CORS_ORIGIN_1>/$CORS_ORIGIN_1/g' \
  -e 's/<CORS_ORIGIN_2>/$CORS_ORIGIN_2/g' \
  -e 's/<CORS_ORIGIN_3>/$CORS_ORIGIN_3/g' \  
  -e 's/<CORS_LOGIN_ORIGIN_1>/$CORS_LOGIN_ORIGIN_1/g' \
  -e 's/<CORS_LOGIN_ORIGIN_2>/$CORS_LOGIN_ORIGIN_2/g' \
  -e 's/<CORS_LOGIN_ORIGIN_3>/$CORS_LOGIN_ORIGIN_3/g' \
  -e 's/<DATABASE_NAME>/$DATABASE_NAME/g' \
  -e 's/<DATABASE_SERVER>/$DATABASE_SERVER/g' \
  -e 's/<DATABASE_BUCKET>/$DATABASE_BUCKET/g' \
  /etc/sync_gateway/config.json