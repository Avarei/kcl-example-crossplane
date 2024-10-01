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
            piplineKclGenerator("")
            piplineStepGenerator("auto-ready", "function-auto-ready", None)
        ]
    }
}

piplineKclGenerator = lambda script: kcl.KCLInput.spec.source -> crossplane.ApiextensionsCrossplaneIoV1CompositionSpecPipelineItems0 {
    crossplane.ApiextensionsCrossplaneIoV1CompositionSpecPipelineItems0 {
        step = "kcl"
        functionRef = {
            name = "function-kcl"
        }
        input = kcl.KCLInput {
            spec.source = script
        }
    }
}

piplineStepGenerator = lambda step: str, functionRefName: str, input: any -> crossplane.ApiextensionsCrossplaneIoV1CompositionSpecPipelineItems0 {
    crossplane.ApiextensionsCrossplaneIoV1CompositionSpecPipelineItems0 {
        step = step
        functionRef = {
            name = functionRefName
        }
        input = input
    }
}
