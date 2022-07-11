import os

fileName = 'fear.txt'
path = os.path.abspath(fileName)

print(path)
print(os.path.basename(path))
print(os.path.dirname(path))
print(os.path.splitext(path))
print(os.path.split(path))

readme_path = os.path.join(os.path.dirname(path), '..', '..', 'README.rst')

print(readme_path)
print(os.path.normpath(readme_path))