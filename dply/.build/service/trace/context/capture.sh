#!/bin/bash
# see: https://pkg.go.dev/net/http/pprof
curl http://${TRACE_SERVICE_NAME}:${TRACE_SERVICE_PORT}/debug/pprof/trace?seconds=${TRACE_INTERVAL} > ~/trace.out
go tool trace -http=trace:${TRACE_SERVICE_PORT} ~/trace.out