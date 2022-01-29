import os
import sys
import subprocess as sp

pwd = os.getcwd
ls = lambda: print(sp.run(["ls", *os.listdir()]).stdout)
