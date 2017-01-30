#!/usr/bin/env bash

#Neo4J logging
    setting "dbms.logs.http.enabled" "true"
    setting "dbms.logs.query.enabled" "true"
    setting "dbms.logs.query.parameter_logging_enabled" "true"

# Graphite integration start
if [ "${GRAPHITE_ENABLED:-false}" = true ]; then
    setting "metrics.enabled" "${GRAPHITE_ENABLED}"
    setting "metrics.graphite.enabled" "${GRAPHITE_ENABLED:-true}"
    setting "metrics.graphite.server" "${GRAPHITE_ADDRESS}"
    setting "metrics.graphite.interval" "${GRAPHITE_INTERVAL:-3m}"
    setting "metrics.prefix" "${GRAPHITE_PREFIX}"
fi
# Graphite integration end

