srcF = dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\final_images\Normal\*.png');
length(srcF)
for i=1:length(srcF)

filename =strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\final_images\Normal\',srcF(i).name);
img = imread(filename);
rotated_img1 = imrotate(img, 33);
name1 = strcat('R33_',srcF(i).name);
path1 = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\final_images\Augumented_N\',name1);
imwrite(rotated_img1,path1)

filename =strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\final_images\Normal\',srcF(i).name);
img = imread(filename);
rotated_img2= imrotate(img, 67);
name1 = strcat('R67_',srcF(i).name);
path1 = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\final_images\Augumented_N\',name1);
imwrite(rotated_img2,path1)

end