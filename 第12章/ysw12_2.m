clc,clear,close all
warning off
% 图像的平移
t = 0:0.02*pi:4*pi;
x = t.*cos(t);
y = t.*sin(t);
z = t/4;
A = [x;y;z];
v = [3;5;2];
n =size(A);
for i=1:n(1,2)
    V(:,i)=v;
end
A1 = A +V;
figure('color',[1,1,1])
plot3(A(1,:),A(2,:),A(3,:),'linewidth',2)
hold on
plot3(A1(1,:),A1(2,:),A1(3,:),'k:','linewidth',2)
grid on
legend('原始图像','平移后的图像')





