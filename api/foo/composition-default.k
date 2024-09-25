import base.crossplane
import base.kcl
import api.foo.xrd

_foo = xrd.Foo {
    spec = xrd.FooSpec {
        parameters = xrd.FooSpecParameters {
            foo = ""
        }
    }
}

crossplane.Composition {
    spec = {
        compositeTypeRef = crossplane.ApiextensionsCrossplaneIoV1CompositionSpecCompositeTypeRef {
            apiVersion = _foo.apiVersion
            kind = _foo.kind
        }
        pipeline = [
            {
                step = "wow"
                functionRef = {
                    name = "foo"
                }
                input = kcl.KclRun {
                    spec.source = ""
                }
            }
        ]
    }
}
