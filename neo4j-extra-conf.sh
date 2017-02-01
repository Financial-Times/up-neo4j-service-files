#!/usr/bin/env bash

setting() {
    setting="${1}"
    value="${2}"
    file="neo4j.conf"

    if [ -n "${value}" ]; then
        if grep -q -F "${setting}=" conf/"${file}"; then
            sed --in-place "s|.*${setting}=.*|${setting}=${value}|" conf/"${file}"
        else
            echo "${setting}=${value}" >>conf/"${file}"
        fi
    fi
}

# Neo4j logging
    setting "dbms.directories.logs" "/data/logs"
# Neo4j http logging
    setting "dbms.logs.http.enabled" "true"
    setting "dbms.logs.http.rotation.keep_number" "0"
    setting "dbms.logs.http.rotation.size" "1m"
#Neo4j querry logging
    setting "dbms.logs.query.enabled" "true"
    setting "dbms.logs.query.parameter_logging_enabled" "true"
    setting "dbms.logs.query.rotation.keep_number" "0"
    setting "dbms.logs.query.rotation.size" "1m"
    setting "dbms.logs.query.threshold" "100ms"

# Graphite integration start
if [ "${GRAPHITE_ENABLED:-false}" = true ]; then
    setting "metrics.enabled" "${GRAPHITE_ENABLED}"
    setting "metrics.graphite.enabled" "${GRAPHITE_ENABLED:-true}"
    setting "metrics.graphite.server" "${GRAPHITE_ADDRESS}"
    setting "metrics.graphite.interval" "${GRAPHITE_INTERVAL:-3m}"
    setting "metrics.prefix" "${GRAPHITE_PREFIX}"
fi
# Graphite integration end

