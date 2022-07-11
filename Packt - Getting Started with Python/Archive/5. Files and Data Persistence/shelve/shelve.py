import shelve

class Person:
    def __init__(self, name, ID):
        self.name = name
        self.ID = ID

with shelve.open('shelf1.shelve') as db:
    db['obi1'] = Person('Obi Wan',123)
    db['ani1'] = Person('Anakin', 456)
    db['a_list'] = [2,3,5]
    db['delete_me'] = 'We will have to delete this one'

    print(list(db.keys))
    
    del db['delete_me']

    print(list(db.keys))

    print('delete_me' in db)
    print('ani' in db)
    
    a_list = db['a_list']
    a_list.append(7)
    db['a_list'] = a_list
    print(db['a_list'])