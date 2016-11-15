#!/bin/sh

. /etc/ergw-gtp-c-node/default-vars.sh

# variable substitution in configuration files
cat /opt/rel/ergw-gtp-r-node/releases/1.3.0/sys.config.templ | \
    envsubst > /opt/rel/ergw-gtp-r-node/releases/1.3.0/sys.config
cat /opt/rel/ergw-gtp-r-node/releases/1.3.0/vm.args.templ | \
    envsubst > /opt/rel/ergw-gtp-r-node/releases/1.3.0/vm.args

ergw-gtp-c-node foreground
