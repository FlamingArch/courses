import shutil
import os

BASE_PATH = 'ops_example' #Base Path
os.mkdir(BASE_PATH)
path_b = os.path.join(BASE_PATH, 'A', 'B')
path_c = os.path.join(BASE_PATH, 'A', 'C')
path_d = os.path.join(BASE_PATH, 'A', 'D')

os.makedirs(path_b)
os.makedirs(path_c)

for filename in ('ex1.txt', 'ex2.txt', 'ex3.txt'):
    with open(os.path.join(path_b, filename), 'w') as stream:
        stream.write('Some content here in filename')

shutil.move(path_b, path_d)

shutil.move(
    os.path.join(path_d, 'ext1.txt'),
    os.path.join(path_d, 'ext1d.txt')
)