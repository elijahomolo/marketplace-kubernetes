#!/bin/sh

set -e


STACK="metrics-server"
CHART="bitnami/metrics-server"
CHART_VERSION="5.3.1"
NAMESPACE="kube-system"

helm uninstall $STACK --namespace $NAMESPACE
