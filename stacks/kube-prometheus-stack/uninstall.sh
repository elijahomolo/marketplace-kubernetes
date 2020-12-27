#!/bin/sh

set -e

################################################################################
# Uninstall releasea and delete CRDs
################################################################################
STACK="kube-prometheus-stack"
NAMESPACE="kube-prometheus-stack"
declare -a CRD=("alertmanagerconfigs.monitoring.coreos.com"
"alertmanagers.monitoring.coreos.com" "podmonitors.monitoring.coreos.com"
"probes.monitoring.coreos.com" "prometheuses.monitoring.coreos.com"
"prometheusrules.monitoring.coreos.com" "servicemonitors.monitoring.coreos.com"
 "thanosrulers.monitoring.coreos.com" )

helm uninstall ${STACK} --namespace ${NAMESPACE} && \
for i in "${CRD[@]}"; do kubectl delete crd $i ; done && kubectl delete \
namespace $NAMESPACE
