#!/bin/sh

set -e

STACK="jaeger"
CHART="jaegertracing/jaeger"
CHART_VERSION="0.28.0"
NAMESPACE="jaeger"

if [ -z "${MP_KUBERNETES}" ]; then
  VALUES="values.yaml"
else
  VALUES="https://raw.githubusercontent.com/digitalocean/marketplace-kubernetes/master/stacks/${STACK}/values.yaml"
fi

# jaegertracing repo needs to be added prior to install
helm repo add jaegertracing https://jaegertracing.github.io/helm-charts && \

helm install "$CHART" \
  --create-namespace \
  --generate-name \
  --namespace "$NAMESPACE" \
  --values "$VALUES" \
  --version "$CHART_VERSION" \
  --wait
