import json

info = {
    'full_name' : 'Sherlock Holmes',
    'address' : {
        'street' : '221B Baker St.',
        'zip' : 'NW1 6XE',
        'city' : 'London',
        'country' : 'UK'
    },    
}

print(json.dumps(info, indent=4, sort_keys=True))
