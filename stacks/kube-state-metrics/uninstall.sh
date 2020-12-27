#!/bin/sh

set -e

################################################################################
# Uninstall release
################################################################################
STACK="kube-state-metrics"
CHART="bitnami/kube-state-metrics"
CHART_VERSION="0.4.2"

helm uninstall ${STACK} --namespace ${NAMESPACE}
