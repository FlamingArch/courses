import io

with io.StringIO as stream:
    stream.write('Learning Python Programming.\n')
    print('Lorem Ipsum', file=stream)
    contents = stream.getvalue()
    print(contents)
