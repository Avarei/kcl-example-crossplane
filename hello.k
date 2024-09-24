# Read the XR
oxr = option("params").oxr
# Patch the XR with the status field
dxr = {
    **oxr
    status.dummy = "cool-status"
}
# Construct a bucket
bucket = {
    apiVersion = "s3.aws.upbound.io/v1beta1"
    kind = "Bucket"
    metadata.annotations: {
        "krm.kcl.dev/composition-resource-name" = "bucket"
    }
    spec.forProvider.region = option("oxr").spec.region
}
# Return the bucket and patched XR
items = [bucket, dxr]
