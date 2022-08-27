import os
import sys
import subprocess as sp
import importlib as imp
import re
from importlib import reload

pwd = os.getcwd
ls = lambda path=".": print(sp.run(["ls", *os.listdir(path)]).stdout)
