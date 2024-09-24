import k8s.api.core.v1 as corev1
import k8s.api.apps.v1 as appsv1
import k8s.apimachinery.pkg.apis.meta.v1
import crossplane.v1 as xv1

import k8s.apiextensions_apiserver.pkg.apis.apiextensions.v1 as apiv1

pod = corev1.Pod {
    spec.containers: [{
        name = "main"
    }]
}

deployment = appsv1.Deployment {
    spec = {
        template.spec.containers: [{
            name = "go"
        }]
        selector = v1.LabelSelector {}
    }
}
_xrd = xv1.CompositeResourceDefinition {
    metadata = v1.ObjectMeta {}
    spec = xv1.ApiextensionsCrossplaneIoV1CompositeResourceDefinitionSpec {
        group = "mygroup.local"
        names = xv1.ApiextensionsCrossplaneIoV1CompositeResourceDefinitionSpecNames {
            kind = "Foo"
            plural = "foos"
        }
        versions = [{
            name = "v1alpha1"
            schema.openAPIV3Schema = ""
        }]
    }
}

_xrd.metadata.name = _xrd.spec.names.plural + "." + _xrd.spec.group

xrd = _xrd

_foo = apiv1.CustomResourceDefinition {
    metadata = v1.ObjectMeta {}
    spec = apiv1.CustomResourceDefinitionSpec {
        group = "postgresql.lan"
        names = apiv1.CustomResourceDefinitionNames {
            kind = "Database"
            plural = "databases"
        }
        scope = ""
        versions = []
    }
}
_foo.metadata.name = _foo.spec.names.plural + "." + _foo.spec.group
foo = _foo
