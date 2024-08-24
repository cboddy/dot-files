try:
    from IPython import get_ipython
    ipy = get_ipython()
    ipy.run_line_magic("load_ext", "autoreload")
    ipy.run_line_magic("autoreload", "2")
    ipy.run_line_magic("matplotlib")
except:
    pass

try:
    import pandas as pd
    import numpy as np
    from datetime import datetime as dt
    import matplotlib.pyplot as plt
    plt.ion()
except:
    pass


