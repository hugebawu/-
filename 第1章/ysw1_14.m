%%
clc,clear,close all
warning off %��������
x=0:0.01:1;
y=3.*x.*log10(x)-(1/30).*exp(-  ( (30.*x-30./exp(1)).^4));
plot(y,x,'m','linewidth',3)
grid on
axis equal %���������ó�����ͬ


%%
clc,clear,close all
warning off
[X, Y] = meshgrid(0.01:0.01:1, 0.01:0.01:1); %����㻯
Z = 11*X.*log10(X).*Y.*(Y-1)+exp(-((25 ...
            *X - 25/exp(1)).^2+(25*Y-25/2).^2).^3)./25;
surfl(X, Y, Z); %3D�������
shading flat    %ƽ����ɫ
colormap(pink)  %��ɫ
view([20 30])   %��ͼ
% colormap(jet)
shading interp %ƽ���ֵ
set (gcf, 'color', 'w') %���ñ�����ɫ


