import base.k8s

schema FunctionInput:
    oxr?: k8s.k8sResource
    ocds?: [CrossplaneResource]
    dxr?: k8s.k8sResource
    dcds?: k8s.k8sResource
    ctx?: any

schema ObservedCompositeResource(k8s.k8sResource):

schema CrossplaneResource:
    Ready?: "True" | "False" | "Unspecified"
    Resource: k8s.k8sResource
    ConnectionDetails?: {str:str}

