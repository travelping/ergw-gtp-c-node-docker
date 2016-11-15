#!/bin/sh

. /etc/ergw-gtp-c-node/default-vars.sh

# variable substitution in configuration files
cat /opt/rel/ergw-gtp-c-node/releases/1.3.0/sys.config.templ | \
    envsubst > /opt/rel/ergw-gtp-c-node/releases/1.3.0/sys.config
cat /opt/rel/ergw-gtp-c-node/releases/1.3.0/vm.args.templ | \
    envsubst > /opt/rel/ergw-gtp-c-node/releases/1.3.0/vm.args

/opt/rel/ergw-gtp-c-node/bin/ergw-gtp-c-node foreground
