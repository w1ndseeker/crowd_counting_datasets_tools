%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File to create grount truth density map for test set%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%dataset = 'A';
%dataset_name = ['shanghaitech_part_' dataset ];


%mkdir(gt_path_csv )
%if (dataset == 'A')
%    num_images = 182;
%else
%    num_images = 316;
%end
path = '/home/ws/crowd/img/';
gt_path = '/home/ws/crowd/';
gt_path_csv = '/home/ws/crowd/den/';
%function im_density = get_density_map_autogaussian(im,annPoints);
for i = 1:10   
%    if (mod(i,10)==0)
%        fprintf(1,'Processing %3d/%d files\n', i, num_images);
%    end
    load(strcat(gt_path, 'mat/',num2str(i),'.mat')) ;
    input_img_name = strcat(path,num2str(i),'.jpg');
    disp(input_img_name);
    im = imread(input_img_name);
    [h, w, c] = size(im);
    if (c == 3)
        im = rgb2gray(im);
    end     
    annPoints =  gt_point;   
    [h, w, c] = size(im);
    %im_density = get_density_map_gaussian(im,annPoints);
    im_density = get_density_map_autogaussian(im,annPoints);
    csvwrite([gt_path_csv ,num2str(i) '.csv'], im_density);       
end