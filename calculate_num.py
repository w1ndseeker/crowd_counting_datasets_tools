import csv
import os
import numpy as np
import pandas as pd


input_path='./den/3.csv'
den = pd.read_csv(input_path, sep=',',header=None).values
den = den.astype(np.float32, copy=False)
gt = np.sum(den)
print(gt)





