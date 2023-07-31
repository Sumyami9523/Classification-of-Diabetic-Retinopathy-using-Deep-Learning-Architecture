f=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\images\*.png');
for i=1:length(f)
filename = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\images\',f(i).name);
% read the RGB image
rgbImage = imread(filename);

grayImage = rgb2gray(rgbImage);

name2 = strcat(f(i).name);
path2 = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\rgb2gray\',name2);
imwrite(grayImage,path2)
end