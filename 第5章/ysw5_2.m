clc,clear,close all
warning off
tic
figure('color',[1,1,1])
[X1,X2] = meshgrid(-10:0.1:10,-10:0.1:10);
Y=sin(X1)./X1.*sin(X2)./X2; 
mesh(X1,X2,Y)
toc