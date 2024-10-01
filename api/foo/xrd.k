import crossplane.v1 as xrdv1
import k8s.apimachinery.pkg.apis.meta.v1 as metav1
import k8s.apiextensions_apiserver.pkg.apis.apiextensions.v1 as crdv1
import base.crossplane
import base.k8s

_group: "avarei.github.com" = "avarei.github.com"
_version = "v1"
_apiVersion: "avarei.github.com/v1" = "avarei.github.com/v1"
_plural = "xfoos"

schema Foo(k8s.k8sResource):
    apiVersion: _apiVersion = _apiVersion
    kind: "Foo" = "Foo"
    metadata?: metav1.ObjectMeta
    spec: FooSpec

schema FooSpec(crossplane.ClaimResourceSpec):
    parameters: FooSpecParameters

schema xFoo(k8s.k8sResource):
    apiVersion: _apiVersion = _apiVersion
    kind: "xFoo" = "xFoo"
    metadata?: metav1.ObjectMeta
    spec: xFooSpec

schema xFooSpec(crossplane.CompositeResourceSpec):
    parameters: FooSpecParameters

schema FooSpecParameters:
    foo: str

xrdv1.CompositeResourceDefinition {
    metadata = {
        name = "${_plural}.${_group}"
    }
    spec = {
        group = "${_group}"
        names = {
            kind = "xFoo"
            plural = "${_plural}"
        }
        claimNames = {
            kind = "Foo"
            plural = "foos"
        }
        versions = [{
            name = "${_version}"
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
