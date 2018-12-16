clc,clear,close all
load topo;
u=0:0.002*pi:2*pi;
v=0:0.002*pi:pi;
[u,v]=meshgrid(u,v);
x=30*cos(u).*cos(v);
y=30*cos(u).*sin(v);
z=30*sin(u);
figure('color',[1,1,1])
subplot(1,2,1)
plot3(x,y,z)
grid on
%增强显示颜色亮度
brighten(0.6)
campos([2,13,10]);
% camlight;
% lighting gouraud;
axis off vis3d;

x1=30.6*cos(u).*cos(v);
y1=29.6*cos(u).*sin(v);
z1=30*sin(u);
subplot(1,2,2)
plot3(x,y,z)
hold on
mesh(x1,y1,z1)
% colormap(topomap1),
axis off vis3d;
