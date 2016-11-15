#!/bin/bash

# creates erlang notation of ip address without netmask
# 192.168.10.1/24 -> 192,168,10,1
ip_erlang() {
    echo $1 | sed 's/\./,/g' - | sed 's/\/.*$//g' -
}

# creates erlang notation of route
# 192.168.10.1/24 -> {192, 168, 10, 1}, 24
route_erlang() {
    echo $1 | sed -e 's/\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\/\([0-9]\{1,2\}\)/{\1, \2, \3, \4}, \5/' -
}

# start general config

export GTP_C_GRX_IP4=${GTP_U_GRX_IP4:-"10.101.1.4/16"}
export GTP_C_GRX_IP4_ROUTES=${GTP_U_GRX_IP4_ROUTES:-"10.180.0.0/16"}
export GTP_C_GRX_IP4_POOL=${GTP_U_GRX_IP4_POOL:-"10.180.0.0/16"}
export GTP_C_GTP_U_NODE=${GTP_C_GTP_U_NODE:-"ergw-gtp-u-node@vlx162-tphh"}

# GTP-U Config
export GTP_C_GRX_IP4_ERLANG="`ip_erlang $GTP_C_GRX_IP4`"
export GTP_C_GRX_IP4_ROUTES_ERLANG="`route_erlang $GTP_U_GRX_IP4_ROUTES`"
export GTP_C_GRX_IP4_POOL_ERLANG="`route_erlang $GTP_U_GRX_IP4_POOL`"

export GTP_COOKIE=${GTP_COOKIE:-"secret"}
