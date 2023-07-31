f=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gauss2\*.png');
g=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\mask\*.png');
for i=1:length(f)
% for i=26:27
filename = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gauss2\',f(i).name);
filename1 = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\mask\',g(i).name);
% read the RGB image
gaussImage = imread(filename);
erodedmask = imread(filename1);

% %Generation of image mask
% mask = im2bw(gaussImage,20/255);
% se = strel('octagon',24);
% erodedmask = im2uint8(imerode(mask,se));

lamda2=prinCur(gaussImage);
maxprincv = im2uint8(lamda2/max(lamda2(:)));
maxprincvmsk = maxprincv.*(erodedmask/255);

name2 = strcat(f(i).name);
path2 = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\mpc_imgs3\',name2);
imwrite(maxprincvmsk,path2)
end