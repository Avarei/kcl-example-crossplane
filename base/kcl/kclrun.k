import base.k8s

schema KCLInput(k8s.k8sResource):
    apiVersion: "krm.kcl.dev/v1alpha1" = "krm.kcl.dev/v1alpha1"
    kind: "KCLInput" = "KCLInput"
    spec: KCLInputSpec

schema KCLInputSpec:
    source: str

