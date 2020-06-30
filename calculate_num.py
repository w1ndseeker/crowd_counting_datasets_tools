import csv
import sys
import glob
import os
import numpy as np
import pandas as pd
# with open('1.csv') as csv_file:
#     row = csv.reader(csv_file, delimiter = ',')
#     next(row)

input_path='./den/3.csv'
den = pd.read_csv(input_path, sep=',',header=None).values
den = den.astype(np.float32, copy=False)
gt = np.sum(den)
print(gt)









# # output_file=sys.argv[2]
# # #定义三个标题，分别代表 文件名，总和，平均值
# # header_list=['filename','total_sales','average_sales']
# # csv_out_file=open(output_file,'a',newline='')
# # filewriter=csv.writer(csv_out_file)
# # filewriter.writerow(header_list)
# #开始循环，找到对应路径下的文件

# with open(input_path,'r',newline='') as csv_in_file:
#     filereader=csv.reader(csv_in_file)
#     # output_list=[]
#     # output_list.append(os.path.basename(input_file))
#     header=next(filereader)
#     total_sales=0.0
#     number_of_sales=0.0
#     #通过循环找出每一行对应的数字来进行求和和平均值
#     for row in filereader:
#         sale_amount=row[3]
#         print(sale_amount)
#         #求和
#         total_sales+=float(str(sale_amount).strip('$').replace(',',''))
#         number_of_sales+=1
#     print(total_sales)
    
    #求平均值
    # average_sales='{0:.2f}'.format(total_sales/number_of_sales)
    # output_list.append(total_sales)
    # output_list.append(average_sales)
    # filewriter.writerow(output_list)

# csv_out_file.close()