import os


def dir_walk(path, remove_tex=False, remove_py=False):
    for fileName in os.listdir(path):
        if fileName[0] == '.':
            continue
        if os.path.isdir(os.path.join(path, fileName)):
            dir_walk(os.path.join(path, fileName), remove_tex=remove_tex, remove_py=remove_py)
            try:
                os.rmdir(os.path.join(path, fileName))
            except OSError:
                pass
        else:
            if fileName.endswith(".pdf"):
                pass
            elif fileName.endswith(".py"):
                if remove_py:
                    os.remove(os.path.join(path, fileName))
            elif fileName.endswith(".tex") or fileName.endswith(".cls"):
                if remove_tex:
                    os.remove(os.path.join(path, fileName))
            else:
                os.remove(os.path.join(path, fileName))

if __name__ == "__main__":
    dir_walk(os.path.abspath(os.path.dirname(__file__)))