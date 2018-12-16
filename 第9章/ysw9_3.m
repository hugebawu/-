clc,clear,close all
warning off
figure('color',[1,1,1])
x = linspace(-2,2,100);
[X,Y,Z] = meshgrid(x,x,x);
I1 = (X.^2+9/4*Y.^2+Z.^2-1).^3-X.^2.*Z.^3-9/80*Y.^2.*Z.^3;
p = patch(isosurface(X,Y,Z,I1,0));
set(p, 'FaceColor', 'red', 'EdgeColor', 'none');
view(3);
axis equal ;
axis off;
light('Posi',[0 -2 3]);    % ��(0,-2,3)�㴦����һ����Դ
lighting phong
set(gca,'nextplot','replacechildren');
%��ǿ��ʾ��ɫ����
brighten(0.6)
campos([2,13,10]);
axis off vis3d;
view([9.93997681865585 29.6119315085364]);