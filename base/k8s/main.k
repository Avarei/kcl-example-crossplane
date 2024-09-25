import k8s.apimachinery.pkg.apis.meta.v1 as metav1

schema k8sResource:
    apiVersion: str
    kind: str
    metadata?: metav1.ObjectMeta

