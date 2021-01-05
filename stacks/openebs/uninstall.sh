#!/bin/sh

set -e

STACK="openebs"
CHART="stable/openebs"
CHART_VERSION="1.10.0"
NAMESPACE="openebs"



helm uninstall $(helm ls -n ${STACK} --short) -n $NAMESPACE && \
 kubectl delete all --all -n ${NAMESPACE} && kubectl delete ns ${NAMESPACE}
