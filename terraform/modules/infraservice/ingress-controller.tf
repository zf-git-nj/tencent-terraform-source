provider "kubectl" {
  # very tricky approach here to avoid terraform init this provider before cluster is ready
  host = data.tencentcloud_kubernetes_clusters.info.list.0.cluster_external_endpoint

  # actually we need kubeconf for cluster access
  config_path = "kube_config"

  # load_config_file = false
  apply_retry_count = 3
}


# Deploy public ingress controller to cluster node pool in DaemonSet mode, with fixed ingress class name
resource "kubectl_manifest" "ingress_controller" {
# Note Do not change ingressClass name
    yaml_body = <<YAML
apiVersion: cloud.tencent.com/v1alpha1
kind: NginxIngress
metadata:
  name: nginx
spec:
  ingressClass: nginx
  service:
    annotation:
      service.cloud.tencent.com/pass-to-target: "true"
      service.kubernetes.io/service.extensiveParameters: '{"InternetAccessible":{"InternetChargeType":"TRAFFIC_POSTPAID_BY_HOUR","InternetMaxBandwidthOut":10}}'
    type: LoadBalancer
  workLoad:
    template:
      affinity: {}
      container:
        image: ccr.ccs.tencentyun.com/paas/nginx-ingress-controller:v1.1.3
        resources:
          limits:
            cpu: "0.5"
            memory: 1024Mi
          requests:
            cpu: "0.25"
            memory: 256Mi
      nodeSelector:
        cloud.tencent.com/auto-scaling-group-id: "${tencentcloud_kubernetes_node_pool.node_pool.auto_scaling_group_id}"
    type: daemonSet
YAML

  depends_on = [tencentcloud_kubernetes_addon_attachment.addon_nginx, local_file.private_key]
}

# remove ingress controller instance creation state from .tfstate
# it could lead to errors in destroy stage
# resource "time_sleep" "wait_for_ingress_controller" {
#   create_duration = "30s"
#   depends_on = [kubectl_manifest.ingress_controller]
# }

# resource "null_resource" "ignore-nginxingress-instance-delete-error" {
#   provisioner "local-exec" {
#     when    = create
#     command = "terraform state rm kubectl_manifest.ingress_controller"
#   }

#   depends_on = [time_sleep.wait_for_ingress_controller]
# }
