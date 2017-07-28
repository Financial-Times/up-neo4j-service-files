#!/usr/bin/env bash

# Neo4j http logging
    setting "dbms.logs.http.enabled" "true"
    setting "dbms.logs.http.rotation.keep_number" "1"
    setting "dbms.logs.http.rotation.size" "1m"
# Neo4j query logging
    setting "dbms.logs.query.enabled" "true"
    setting "dbms.logs.query.parameter_logging_enabled" "true"
    setting "dbms.logs.query.rotation.keep_number" "1"
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

# Set transaction logs to keep 2 days worth.
setting "dbms.tx_log.rotation.retention_policy" "2 days"
setting "dbms.threads.worker_count" "64"

