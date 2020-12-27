#!/bin/sh

set -e


STACK="helm3-test"
CHART="stable/kube-state-metrics"
CHART_VERSION="2.8.4"
NAMESPACE="helm3-test"

helm uninstall kube-state-metrics-1609030850 -n $NAMESPACE && kubectl delete namespace $NAMESPACE
