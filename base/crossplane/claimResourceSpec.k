schema ClaimResourceSpec:
    compositeDeletionPolicy?: "Background" | "Foreground"
    compositionRef?: NameReference
    compositionRevisionRef?: NameReference
    compositionRevisionSelector?: LabelSelector
    compositionSelector?: LabelSelector
    compositionUpdatePolicy?: "Automatic" | "Manual"
    publishConnectionDetailsTo?: CompositeResourceSpecPublishConnectionDetailsTo
    resourceRef?: [ResourceReference]
    writeConnectionSecretToRef?: NamespacedNameReference

