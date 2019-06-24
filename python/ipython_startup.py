'''
ipython_startup.py

Code that is run upon entering every IPython session.
'''

import IPython

import matplotlib.pyplot as plt
import numpy as np

ipython = IPython.get_ipython()

ipython.magic("load_ext autoreload")
ipython.magic("autoreload 2")
ipython.magic("matplotlib")

print('\nLoaded numpy as np and matplotlib.pyplot plt.')
