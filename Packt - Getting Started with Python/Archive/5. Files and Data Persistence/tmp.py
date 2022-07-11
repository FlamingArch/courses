import os
from tempfile import NamedTemporaryFile, TemporaryDirectory

with TemporaryDirectory(dir='.') as td:
    print('Temp Directory: ', td)
    with NamedTemporaryFile(dir=td) as t:
        name=t.name;
        print(os.path.abspath(name))