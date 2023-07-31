f=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\images\*.png');
for i=1:length(f)
% for i=26:27
filename = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\images\',f(i).name);
% read the RGB image
Image = imread(filename);
Image = imresize(Image, [512, 512]);
%Generation of image mask
mask = im2bw(Image,20/255);
se = strel('octagon',24);
erodedmask = im2uint8(imerode(mask,se));

name2 = strcat(f(i).name);
path2 = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\mask\',name2);
imwrite(erodedmask,path2)
end