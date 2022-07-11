import sys
import json

data = {
    'big number' : 2 ** 3141,
    'max_float' : sys.float_info.max,
    'a_list' : [2,3,5,7]
}

json_data = json.dumps(data)
data_out = json.loads(json_data)
assert data == data_out

