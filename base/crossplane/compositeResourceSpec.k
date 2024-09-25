schema CompositeResourceSpec:
    claimRef?: CompositeResourceSpecClaimRef
    compositionRef?: NameReference
    compositionRevisionRef?: NameReference
    compositionRevisionSelector?: LabelSelector
    compositionSelector?: LabelSelector
    compositionUpdatePolicy?: "Automatic" | "Manual"
    environmentConfigRefs?: [ResourceReference]
    publishConnectionDetailsTo?: CompositeResourceSpecPublishConnectionDetailsTo
    resourceRefs?: [ResourceReference]
    writeConnectionSecretToRef?: NamespacedNameReference

schema CompositeResourceSpecClaimRef:
    apiVersion: str
    kind: str
    name: str
    namespace: str

schema NameReference:
    name: str

schema NamespacedNameReference:
    name: str
    namespace: str

schema LabelSelector:
    matchLabels: {str:str}

schema ResourceReference:
    apiVersion: str
    kind: str
    name?: str

schema CompositeResourceSpecPublishConnectionDetailsTo:
    configRef?: NameReference
    metadata?: CompositeResourceSpecPublishConnectionDetailsToMetadata
    name: str

schema CompositeResourceSpecPublishConnectionDetailsToMetadata:
    annotations: {str:str}
    labels: {str:str}
    type: str

