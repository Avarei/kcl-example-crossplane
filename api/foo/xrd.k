import crossplane.v1 as xrdv1
import k8s.apimachinery.pkg.apis.meta.v1 as metav1
import k8s.apiextensions_apiserver.pkg.apis.apiextensions.v1 as crdv1
import base.crossplane
import base.k8s

schema Foo(k8s.k8sResource):
    apiVersion: "v1" = "v1"
    kind: "Foo" = "Foo"
    metadata?: metav1.ObjectMeta
    spec: FooSpec

schema FooSpec(crossplane.CompositeResourceSpec):
    parameters: FooSpecParameters

schema FooSpecParameters:
    foo: str

xrdv1.CompositeResourceDefinition {
    spec = {
        group = "foo"
        names = {
            kind = "xFoo"
            plural = "xfoos"
        }
        claimNames = {
            kind = "Foo"
            plural = "foos"
        }
        versions = [{
            name = "v1alpha1"
            schema.openAPIV3Schema = crdv1.JSONSchemaProps {
                type = "object"
                properties = {
                    spec = crdv1.JSONSchemaProps {
                        type: "string"
                    }
                }
            }
            served = True
            referenceable = True
        }]
    }
}
