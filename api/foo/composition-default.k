import base.crossplane
import api.foo.xrd

input: crossplane.FunctionInput = option("params")
test: xrd.xFoo = input.oxr

_items = {
    isx = test?.kind or "?"
}

items = _items
