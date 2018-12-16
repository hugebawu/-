clc,clear,close all
warning off
% ц╓хкоби╫
figure('color',[1,1,1])
ezmesh('8*x1^2+9*x2^2-8*x1*x2-12*x1-6*x2',[-2,4,-2,4])
view([-24.5 2]);
grid off
axis off

xmin=0;
xmax=4;
ymin=0;
ymax=4;
x1=linspace(xmin,xmax,20);
x2=linspace(ymin,ymax,20);
[X1,X2]=meshgrid(x1,x2);
[Z,DZ1,DZ2]=jt(X1,X2);
figure('color',[1,1,1])
contour(X1,X2,Z,40)
hold on
quiver(X1,X2,-DZ1,-DZ2)





