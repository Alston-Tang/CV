from datetime import datetime
import os
from shutil import copy
import re
from subprocess import run
from clean import dir_walk



print("Begin generating CV instance")
baseDir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
cwd = os.path.dirname(os.path.abspath(__file__))
company_name = os.path.basename(cwd).split('-')[0]
tex_file = "HaomoTang_" + company_name + ".tex"

print("Rename")
os.rename(os.path.join(cwd, "cv.tex"), os.path.join(cwd, tex_file))

print("Compile")

run(["pdflatex", tex_file])

print("Clean")
dir_walk(cwd, remove_py=True, remove_tex=True)

print("Finish")
