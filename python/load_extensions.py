# ~/.ipython/profile_default/startup/load_extensions.py

get_ipython().run_line_magic('load_ext', 'autoreload')
get_ipython().run_line_magic('autoreload', '2')

try:
    import matplotlib.pyplot as plt
    import pandas as pd
except:
    pass
