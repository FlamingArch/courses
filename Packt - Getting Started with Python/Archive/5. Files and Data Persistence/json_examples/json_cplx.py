import json

class ComplexEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, complex):
            return {
                '_meta' : 'complex',
                'num' : [o.real, o.imag],
            }
        return json.JSONEncoder.default(self, o)

data = {
    'an_int' : 42,
    'a_float' : 3.14159265,
    'a_complex' : 3 + 4j,
}

json_data = json.dumps(data, cls=ComplexEncoder)
print(json_data)

def object_hook(o):
    try:
        if o['_meta'] == 'complex':
            return complex(*o['num'])
    except (KeyError, TypeError):
        return o

data_out = json.loads(json_data, object_hook=object_hook)
print(data_out)
