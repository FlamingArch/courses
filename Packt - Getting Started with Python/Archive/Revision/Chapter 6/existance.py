import os

filename = input('Enter Filename: > ')
path = os.path.dirname(os.path.abspath(filename))

print('File Exists: ', os.path.isfile(filename))
print('Path Exists: ', os.path.isdir(path))
print('Full Path: ', path)
