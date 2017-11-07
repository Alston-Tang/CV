import os
from shutil import copy


def mirror(root_a, root_b, pattern, ignore_hidden=True):
    for file_name in os.listdir(root_a):
        if os.path.isdir(file_name):
            if file_name[0] == '.':
                continue
            next_dir = os.path.join(root_b, file_name)
            if not os.path.exists(next_dir):
                os.makedirs(next_dir)
            mirror(os.path.join(root_a, file_name), os.path.join(root_b, file_name), pattern)
        else:
            if pattern.match(file_name):
                copy(os.path.join(root_a, file_name), os.path.join(root_b, file_name))


