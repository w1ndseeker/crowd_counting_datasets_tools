# 人群密度标注工具使用说明

1 将需要标注的图片文件放到`./img`路径下

2 运行脚本文件对图片重命名

```
python3  rename.py
```

3 使用matlab打开`build_datasets.m`文件，修改相关路径，修改for循环中的`1:11`，将11改为`./img`路径下图片数量，点击运行开始标注，只标人头，没露头的人不标，标错了按`Q` 重新标注

4 使用matlab打开`to_csv.m`,修改相关路径，修改for循环中的数字，点击运行后会在`./den`路径下生成对应的csv文件

5 生成CSV文件时可以使用自适应高斯核和固定高斯核，修改

```
 im_density = get_density_map_autogaussian(im,annPoints);
```

使用固定核修改为`get_density_map_gaussian` 

使用`calculate_num.py`可以计算csv文件中的人头数量

`todenmapimg.m`可以生成图片格式的密度图



> ​                ---ws 2020.6.30
