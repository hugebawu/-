clc,clear,close all
warning off
% 图像的旋转
t = 0:0.02*pi:4*pi;
x = t.*cos(t);
y = t.*sin(t);
z = t/4;
A = [x;y;z];
u= pi/2;  % 旋转90度
Rx=[1,0,0
    0,cos(u),-sin(u);
    0,sin(u),cos(u)];  % 绕x轴旋转矩阵
A1 = Rx*A;
figure('color',[1,1,1])
plot3(A(1,:),A(2,:),A(3,:),'linewidth',2)
hold on
plot3(A1(1,:),A1(2,:),A1(3,:),'r:','linewidth',3)
grid on
legend('原始图像','绕x轴旋转矩阵后的图像')



