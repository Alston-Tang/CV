from datetime import datetime
import os
from shutil import copy
import re
from subprocess import run


def dir_walk(path):
    for fileName in os.listdir(path):
        if os.path.isdir(os.path.join(path, fileName)):
            dir_walk(os.path.join(path, fileName))
        else:
            if fileName.endswith(".tex") or fileName.endswith(".pdf") or fileName.endswith(".cls"):
                pass
            else:
                os.remove(os.path.join(path, fileName))

print("Begin generating CV instance")
baseDir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
cwd = os.path.dirname(os.path.abspath(__file__))

print("Copy components tex")
with open(os.path.join(cwd, "cv.tex"), encoding="utf-8") as mainTex:
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

run(["pdflatex", "cv.tex"])

print("Clean")
dir_walk(cwd)

print("Finish")











