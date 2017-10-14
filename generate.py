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
tex_file = company_name + ".tex"

print("Copy components tex")
with open(os.path.join(cwd, tex_file), encoding="utf-8") as mainTex:
    while True:
        line = mainTex.readline()
        if line == "":
            break
        line = line.strip()
        matchRes = re.match(r'\\input\{(.*)\}', line, re.S)
        if matchRes:
            relPath = matchRes.group(1).strip() + ".tex"
            relDir = os.path.dirname(relPath)
            if not os.path.isdir(os.path.join(cwd, relDir)):
                os.mkdir(os.path.join(cwd,relDir))
            copy(os.path.join(baseDir, relPath), os.path.join(cwd, relPath))

print("Compile")

run(["pdflatex", tex_file])

print("Clean")
dir_walk(cwd, remove_py=True, remove_tex=True)

print("Finish")
