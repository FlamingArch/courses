import os.path

filename = 'fear2.txt'
path = os.path.dirname(os.path.abspath(filename))
fakedir = '/usr/bitch'

print(os.path.isdir(path))
print(os.path.isfile(filename))
print(path)