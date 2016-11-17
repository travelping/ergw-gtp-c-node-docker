FROM grundrausch3n/ergw-gtp-c-node-base

WORKDIR /
COPY ergw-gtp-c-start.sh /usr/bin/
COPY default-vars.sh /etc/ergw-gtp-c-node/
# Copy templates
COPY config/sys.config.templ /etc/ergw-gtp-c-node/
COPY config/vm.args.templ /etc/ergw-gtp-c-node/

CMD ["ergw-gtp-c-start.sh"]
