import os

for root,dirs,files in os.walk('.'):
    print(os.path.abspath(root))
    if dirs:
        print('Directories:')
        for dirc in dirs:
            print(dirc)
        print()
    if files:
        print('Files:')
        for filec in files:
            print(filec)
        print()
