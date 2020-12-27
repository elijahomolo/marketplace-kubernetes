#!/bin/sh

set -e


STACK="jaeger"
CHART="jaegertracing/jaeger"
CHART_VERSION="0.28.0"
NAMESPACE="jaeger"

# Using helm ls to output release name since an arbitary integer is appended
helm uninstall $(helm ls -n ${STACK} --short) -n $NAMESPACE && \
 kubectl delete namespace $NAMESPACE
