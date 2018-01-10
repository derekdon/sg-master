FROM couchbase/sync-gateway:1.3.1-community

MAINTAINER Derek Donnelly, derek@codex9.com

# copy the default config into the container
COPY config/sync_gateway_config.json /etc/sync_gateway/config.json

# Add bootstrap script
COPY scripts/entry.sh /opt/bin/entry.sh
RUN chmod 755 /opt/bin/entry.sh
ENTRYPOINT ["/opt/bin/entry.sh"]