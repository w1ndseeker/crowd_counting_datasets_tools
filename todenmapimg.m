clear;
m=602;n=800;
%m=m/4;
%n=n/4;
GTStr='/home/ws/crowd/mat/';
GTMAT='.mat';
IMGStr='/home/ws/crowd/img/';
IMG='.jpg';
gt_path_csv = '/home/ws/crowd/den/';
%shanghaih5str='shanghai\train_data\train_data.h5';
%h5create(shanghaih5str,'/label',[259 192 1 2],'Datatype','double'); 
for num=1:10
    gtSTR =sprintf('%s%d%s', GTStr,num , GTMAT ) ;
    imgSTR=sprintf('%s%d%s', IMGStr,num , IMG ) ;
    load(gtSTR);
    img=imread(imgSTR);
    %Reimg=imresize(img,0.25);
    gt=gt_point;
    %gt=F;
    %gt=gt/4;
    d_map = zeros(m,n);

    for j=1:size(gt,1)
        if(gt(j,2)>0&&gt(j,2)<235)%表示离镜头比较远
            ksize=30;
        end
        if(gt(j,2)>=235&&gt(j,2)<260)
            ksize=40;
        end
         if(gt(j,2)>=260&&gt(j,2)<360)
            ksize=40;
         end
        if(gt(j,2)>=360&&gt(j,2)<=602)
            ksize=40;
        end

        radius =ceil(ksize/2);
        sigma = ksize/2.5; 
        h = fspecial('gaussian',[ksize],sigma);


        x_ = max(1,floor(gt(j,1)));  
        y_ = max(1,floor(gt(j,2)));  
  %在索引区的素有列按照从右往左的顺序依次加到矩阵
       if (x_-radius+1<1)  
              for ra = 0:radius-x_-1  
                   h(:,end-ra) = h(:,end-ra)+h(:,1);  
                   h(:,1)=[];  
              end  
       end  
       if (y_-radius+1<1)  
           for ra = 0:radius-y_-1  
               h(end-ra,:) = h(end-ra,:)+h(1,:);  
               h(1,:)=[];  
           end  
       end  


       if (x_+ksize-radius>n)  
           for ra = 0:x_+ksize-radius-n-1  
               h (:,1+ra) = h(:,1+ra)+h(:,end);  
               h(:,end) = [];  
           end  
       end  
       if(y_+ksize-radius>m)  
            for ra = 0:y_+ksize-radius-m-1  
                h (1+ra,:) = h(1+ra,:)+h(end,:);  
                h(end,:) = [];  
            end  
       end  
          d_map(max(y_-radius+1,1):min(y_+ksize-radius,m),max(x_-radius+1,1):min(x_+ksize-radius,n))...  
             = d_map(max(y_-radius+1,1):min(y_+ksize-radius,m),max(x_-radius+1,1):min(x_+ksize-radius,n))...  
              + h; 
    end 
    vi_map=imagesc(d_map);
    csvwrite([gt_path_csv ,num2str(num) '.csv'], d_map); 
 %   figure; 
    VIstr=num2str(num,'/home/ws/crowd/den_img/%d.jpg');
    disp(VIstr);
    %imwrite(vi_map,VIstr);  
    saveas(gcf,VIstr);
    
end
