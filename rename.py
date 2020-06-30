
import os
 
img_path="./img/"

imglist=os.listdir(img_path)
total_num=len(imglist)

i=1
for img in imglist:
    if img.endswith(".jpg"):
        old_path=os.path.join(img_path,img)
        new_path=os.path.join(img_path,str(i)+'.jpg')

        os.renames(old_path,new_path)
        print( u"重命名"+old_path+u"变为"+new_path)
        i=i+1

print("总共"+str(total_num)+"张图片被重命名为:" "1.jpg~"+format(str(i-1))+".jpg形式")
 
