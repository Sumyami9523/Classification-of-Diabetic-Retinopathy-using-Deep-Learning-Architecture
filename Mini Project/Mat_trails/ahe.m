f=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\mpc_imgs3\*.png');
for i=1:length(f)
% for i=26:27
filename = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\mpc_imgs3\',f(i).name);
% read the RGB image
mpcImage = imread(filename);

%Contrast enhancement.
newprI = adapthisteq(mpcImage,'numTiles',[8 8],'nBins',128); 
thresh = isodata(newprI);
vessels = im2bw(newprI,thresh);
%Filtering out small segments
vessels = bwareaopen(vessels, 1500);
segImage = vessels;

name2 = strcat(f(i).name);
path2 = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\ahe_imgs3\',name2);
imwrite(segImage,path2)
end