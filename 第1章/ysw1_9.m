clear;close all
clc
a1=imread('1.png'); a1 =imresize(a1,[512 512]);  %图像压缩到尺寸到512*512
a2=imread('2.png'); a2 =imresize(a2,[512 512]);  %图像压缩到尺寸到512*512
a3=imsubtract(a2,a1);      %连续两帧图像做差
figure,imshow(a3);

%%
clear;close all
clc
a = imread('3.jpg');
figure,imshow(a)
a1=a(1:300,1:floor(785/2),:); 
a2=a(1:300,floor(785/2)+2:end,:); 
a3 = imsubtract(a2,a1);      %连续两帧图像做差
a4 = imsubtract(a1,a2);      %连续两帧图像做差
a5 = a3+a4;
figure,imshow(a5);

%%
clc,clear;close all
warning off
a = imread('1.jpg');
figure,imshow(a)
a1=a(1:480,1:floor(640/2),:); 
a2=a(1:480,floor(640/2)+1:end,:); 
a3=imsubtract(a2,a1);      %连续两帧图像做差
figure,imshow(a3);
%%
clc,clear;close all
warning off
a = imread('2.jpg');
figure,imshow(a)
a1=a(1:286,1:380,:); 
a2=a(1:286,394:773,:); 
a3=imsubtract(a2,a1);      %连续两帧图像做差
figure,imshow(a3);


