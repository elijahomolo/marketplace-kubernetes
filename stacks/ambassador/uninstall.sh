STACK="ambassador"
CHART="datawire/ambassador"
CHART_VERSION="6.5.13"
NAMESPACE="ambassador"

CRD=("authservices.getambassador.io"
"consulresolvers.getambassador.io"
"devportals.getambassador.io"
"hosts.getambassador.io"
"kubernetesendpointresolvers.getambassador.io"
"kubernetesserviceresolvers.getambassador.io"
"logservices.getambassador.io"
"mappings.getambassador.io"
"modules.getambassador.io"
"ratelimitservices.getambassador.io"
"tcpmappings.getambassador.io"
"tlscontexts.getambassador.io"
"tracingservices.getambassador.io"
"filterpolicies.getambassador.io"
"filters.getambassador.io"
"ratelimits.getambassador.io"
"projectcontrollers.getambassador.io"
"projects.getambassador.io"
"projectrevisions.getambassador.io")


helm uninstall $STACK --namespace $STACK && for crd in ${CRD[@]}; \
 do kubectl delete crd $crd; done
