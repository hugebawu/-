%%
clc,clear,close all
warning off %消除警告
x=0:0.01:1;
y=3.*x.*log10(x)-(1/30).*exp(-  ( (30.*x-30./exp(1)).^4));
plot(y,x,'m','linewidth',3)
grid on
axis equal %坐标轴设置长度相同


%%
clc,clear,close all
warning off
[X, Y] = meshgrid(0.01:0.01:1, 0.01:0.01:1); %网格点化
Z = 11*X.*log10(X).*Y.*(Y-1)+exp(-((25 ...
            *X - 25/exp(1)).^2+(25*Y-25/2).^2).^3)./25;
surfl(X, Y, Z); %3D曲面绘制
shading flat    %平面着色
colormap(pink)  %粉色
view([20 30])   %视图
% colormap(jet)
shading interp %平面插值
set (gcf, 'color', 'w') %设置背景颜色


