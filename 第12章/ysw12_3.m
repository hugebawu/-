clc,clear,close all
warning off
% ͼ�������
t = 0:0.02*pi:4*pi;
x = t.*cos(t);
y = t.*sin(t);
z = t/4;
A = [x;y;z];
K=[1.5,0,0;0,6,0;0,0,2];  % �������
A1 = K*A;
figure('color',[1,1,1])
plot3(A(1,:),A(2,:),A(3,:),'linewidth',2)
hold on
plot3(A1(1,:),A1(2,:),A1(3,:),'r:','linewidth',3)
grid on
legend('ԭʼͼ��','������ͼ��')





