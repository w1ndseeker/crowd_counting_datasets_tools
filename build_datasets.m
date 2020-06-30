%对图片上某个点进行标注
clear all
close all
clc
set(gcf,'color','white')%图片的背景设置为白色
src='';
path = '/home/ws/crowd/img/';
gt_path = '/home/ws/crowd/mat/';
gt_path_csv = '/home/ws/crowd/csv/';
for i=1:10   %根据图片张数进行修改
    num = i;
    str = '.jpg' ;
    Mstr='.mat';
    filestr='/home/ws/crowd/img/'; %路径，自行调整
    refilestr='/home/ws/crowd/mat/';
    left_par='';
    Mark='mark';
    right_par=')';
    STR = sprintf('%s%s%d%s%s', filestr,left_par,num, str) ;
    RSTR=sprintf('%s%s%d%s%s', refilestr,left_par,num , str) ;
    MSTR=sprintf('%s%s%d%s%s', refilestr,left_par,num, Mstr) ;
    MarkSTR=sprintf('%s%d%s', refilestr,Mark,num , Mstr) ;
    pic=imread(STR); 
    %pic=imresize(pic_source,[602,800]);%调整图像的大小,
    %imwrite(pic,RSTR);%实际修改本地的图片
    showpic=imshow(pic);

    gt_point = [0,0];%用于存储标记点
    while(1)
        [x1,y1]=ginput(1);
        Atemp=[x1,y1];
        gt_point = [gt_point;Atemp];
        hold on
        plot(x1,y1,'r+');
        
        % Q键逐步撤销之前标注的点
        if strcmpi(get(gcf,'CurrentCharacter'),'q')
            if size(gt_point,1)>0
                gt_point(size(gt_point,1),:)=[];%非回车会以鼠标当前点做一次存储,这是多余的,删除
            end
            %重新做图
            close all
            showpic=imshow(pic);
            if size(gt_point,1) >0
                gt_point(size(gt_point,1),:)=[];
                for j = 1:size(gt_point,1)
                    hold on
                    plot(gt_point(j,1),gt_point(j,2),'r+');
                end
            end
        end  
        
        %回车键结束本次图片标定
        if strcmpi(get(gcf,'CurrentCharacter'),char(13))
            break;
        end
        
    end
    gt_point(1,:)=[];%删除第一行多余的0行    
    save(MSTR,'gt_point');   
    close all
end
