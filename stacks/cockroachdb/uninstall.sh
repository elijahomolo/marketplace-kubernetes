#!/bin/sh

set -e


STACK="cockroachdb"
CHART="cockroachdb/cockroachdb"
CHART_VERSION="5.0.0"
NAMESPACE="cockroachdb"

helm uninstall $STACK -n $NAMESPACE && kubectl delete namespace $NAMESPACE
