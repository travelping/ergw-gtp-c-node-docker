FROM grundrausch3n/ergw-docker-base

WORKDIR /
COPY _build/prod/rel/ /opt/rel/
COPY ergw-gtp-c-start.sh /usr/bin/
COPY default-vars.sh /etc/ergw-gtp-c-node/
# Copy templates
COPY config/sys.config.templ /opt/rel/ergw-gtp-c-node/releases/1.3.0/
COPY config/vm.args.templ /opt/rel/ergw-gtp-c-node/releases/1.3.0/

CMD ["ergw-gtp-c-start.sh"]
