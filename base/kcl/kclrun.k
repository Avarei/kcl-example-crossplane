import base.k8s

schema KclRun(k8s.k8sResource):
    apiVersion: "krm.kcl.dev/v1alpha1" = "krm.kcl.dev/v1alpha1"
    kind: "KCLRun" = "KCLRun"
    spec: KclRunSpec

schema KclRunSpec:
    source: str

