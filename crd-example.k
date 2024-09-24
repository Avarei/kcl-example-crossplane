import k8s.apiextensions_apiserver.pkg.apis.apiextensions.v1

#    spec.versions[int].schema: JSONSchemaProps{}
v1.CustomResourceDefinition {
    spec = v1.CustomResourceDefinitionSpec {
        group = "foo"
        names = v1.CustomResourceDefinitionNames {
            kind = "Foo"
            plural = "foos"
        }
        scope = ""
        versions = [{
            name = "v1alpha1"
            schema.openAPIV3Schema = v1.JSONSchemaProps {
                type = "object"
                properties = {
                    anx = {
                        type: "string"
                    }
                }
            }
            served = True
            storage = True
        }]
    }
}
