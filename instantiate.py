from datetime import datetime
import os
from shutil import copy
import re

print("Begin generating CV instance")

name = input("Name of this instance ?")
curDateTime = datetime.utcnow()
name += "-" + curDateTime.strftime("%y-%m-%d-%M%S")
baseDir = os.path.dirname(os.path.abspath(__file__))

cwd = os.path.join(baseDir, "instances")
if not os.path.isdir(cwd):
    os.mkdir(cwd)

cwd = os.path.join(cwd, name)
if not os.path.isdir(name):
    os.mkdir(cwd)

print("Copy class file")
copy(os.path.join(baseDir, "cv.cls"), os.path.join(cwd, "cv.cls"))
print("Copy main tex file")
copy(os.path.join(baseDir, "cv.tex"), os.path.join(cwd, "cv.tex"))
print("Copy generation script")
copy(os.path.join(baseDir, "generate.py"), os.path.join(cwd, "generate.py"))