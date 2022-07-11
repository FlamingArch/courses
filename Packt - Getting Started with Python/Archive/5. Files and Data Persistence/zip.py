from zipfile import ZipFile

with ZipFile('Example.zip', 'w') as zp:
    zp.write('Content1.txt')
    zp.write('Content2.txt')
    zp.write('subfolder/Content3.txt')
    zp.write('subfolder/Content4.txt')

with ZipFile('example.zip') as zp:
    zp.extract('Content1.txt', 'extractzip')
    zp.extract('subfolder/Content3.txt', 'extractzip')
