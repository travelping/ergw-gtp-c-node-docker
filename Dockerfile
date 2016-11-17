FROM grundrausch3n/ergw-docker-base

WORKDIR /
COPY _build/prod/rel/ /opt/rel/
COPY ergw-gtp-c-start.sh /usr/bin/
COPY default-vars.sh /etc/ergw-gtp-c-node/
# Create folder for statefiles
RUN mkdir -p /var/lib/ergw/
# Copy templates
COPY config/sys.config.templ /etc/ergw-gtp-c-node/
COPY config/vm.args.templ /etc/ergw-gtp-c-node/

CMD ["ergw-gtp-c-start.sh"]
