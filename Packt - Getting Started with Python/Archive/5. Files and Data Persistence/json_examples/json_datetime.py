import json

from datetime import datetime, timedelta, timezone

now = datetime.now()
now_tz = datetime.now(tz=timezone(timedelta(hours=1)))

class DateTimeEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            try:
                off = obj.utcoffset().seconds
            except AttributeError:
                off = None
            return {
                '_meta' : '_datetime',
                'data' : obj.timetuple()[:6] + (obj.microsecond, ),
                'utcoffset' : off,
            }
        return json.JSONEncoder.default(self,obj)

data = {
    'an_int' : 42,
    'a_float' : 3.14159265,
    'a_datetime' : now,
    'a_datetime_tz' : now_tz,
}

def object_hook(obj):
    try:
        if obj['_meta'] == '_datetime':
            tz = None
        else:
            tz = timezone(timedelta(seconds=obj['utcoffset']))
    except (KeyError, TypeError):
        return obj

json_data = json.dumps(data, cls=DateTimeEncoder)
print(json_data)

data_out = json.loads(json_data, object_hook=object_hook)