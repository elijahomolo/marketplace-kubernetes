#!/bin/sh

set -e

STACK="op-scim-bridge"
CHART="op-scim-bridge/op-scim"
CHART_VERSION="1.6.1"
NAMESPACE="op-scim-bridge"



helm uninstall ${STACK} --namespace ${NAMESPACE} && \
kubectl delete ns ${NAMESPACE}
