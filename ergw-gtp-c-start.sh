#!/bin/sh

. /etc/ergw-gtp-c-node/default-vars.sh

# variable substitution in configuration files
RELPATH=$(find /opt/rel/ergw-gtp-c-node/releases/ -mindepth 1 -maxdepth 1 -type d)
cat /etc/ergw-gtp-c-node/sys.config.templ | \
    envsubst > $RELPATH/sys.config
cat /etc/ergw-gtp-c-node/vm.args.templ | \
    envsubst > $RELPATH/vm.args

/opt/rel/ergw-gtp-c-node/bin/ergw-gtp-c-node foreground
