provider "kubectl" {
  config_path = "kube_config"
  load_config_file = true
}

resource "kubectl_manifest" "NginxIngress" {
    yaml_body = <<YAML
apiVersion: cloud.tencent.com/v1alpha1
kind: NginxIngress
metadata:
  name: nginx-ingress
spec:
  ingressClass: nginx-ingress
  service:
    annotation:
      service.kubernetes.io/service.extensiveParameters: '{"InternetAccessible":{"InternetChargeType":"TRAFFIC_POSTPAID_BY_HOUR","InternetMaxBandwidthOut":10}}'
    type: LoadBalancer
  workLoad:
    hpa:
      enable: true
      maxReplicas: 2
      metrics:
      - pods:
          metricName: k8s_pod_rate_cpu_core_used_limit
          targetAverageValue: "80"
        type: Pods
      minReplicas: 1
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
    # nodeSelector:
      # cloud.tencent.com/auto-scaling-group-id: asg-d0c7cl1v  # node pool scaling group id is required
    type: deployment
YAML
  
  depends_on = [tencentcloud_kubernetes_addon_attachment.addon_nginx]
}