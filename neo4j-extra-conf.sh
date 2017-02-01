#!/usr/bin/env bash

# Neo4j logging
    setting "dbms.directories.logs" "/data/logs"
# Neo4j http logging
    setting "dbms.logs.http.enabled" "true"
    setting "dbms.logs.http.rotation.keep_number" "1"
    setting "dbms.logs.http.rotation.size" "1m"
#Neo4j querry logging
    setting "dbms.logs.query.enabled" "true"
    setting "dbms.logs.query.parameter_logging_enabled" "true"
    setting "dbms.logs.query.rotation.keep_number" "1"
    setting "dbms.logs.query.rotation.size" "1m"
    setting "dbms.logs.query.threshold" "100ms"
#Neo4j reduces logging output for raft checks
    setting "dbms.logs.debug.level" "ERROR"

# Graphite integration start
if [ "${GRAPHITE_ENABLED:-false}" = true ]; then
    setting "metrics.enabled" "${GRAPHITE_ENABLED}"
    setting "metrics.graphite.enabled" "${GRAPHITE_ENABLED:-true}"
    setting "metrics.graphite.server" "${GRAPHITE_ADDRESS}"
    setting "metrics.graphite.interval" "${GRAPHITE_INTERVAL:-3m}"
    setting "metrics.prefix" "${GRAPHITE_PREFIX}"
fi
# Graphite integration end

