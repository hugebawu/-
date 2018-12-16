clc,clear,close all
warning off
z=0:0.05:8*pi;
x=sin(z);
y=cos(z);
figure(1),plot3(x,y,z)

%%
clc,clear,close all
warning off
%产生双螺旋数据 
i=(1:1:100)';
%双螺旋数据点的产生方程
alpha1=pi*(i-1)/25;
beta=0.4*((105-i)/104);
x0=0.5+beta.*sin(alpha1);
y0=0.5+beta.*cos(alpha1);
x1=0.5-beta.*sin(alpha1);
y1=0.5-beta.*cos(alpha1);
plot(x0,y0,'r*');
hold on;
plot(x1,y1,'go');

%%
clc,clear,close all
warning off
% 静态螺旋线
a=0:0.1:20*pi;
h=plot3(a.*cos(a),a.*sin(a),2.*a,'b','linewidth',2);
axis([-50,50,-50,50,0,150]);
grid on
set(h,'erasemode','none','markersize',22);
xlabel('x轴');ylabel('y轴');zlabel('z轴');
title('静态螺旋线');
%%
clc,clear,close all
warning off
% 双叶双曲面
figure('color',[1,1,1])
ezsurf('8*tan(u)*cos(v)','8.*tan(u)*sin(v)','2.*sec(u)',[-pi./2,3*pi./2,0,2*pi])
axis equal
grid on
axis square
xlabel('x轴');ylabel('y轴');zlabel('z轴');
title('双叶双曲面')
%%
clc,clear,close all
warning off
t=0:0.00001:0.02;
r=1;
ang=360*t;
s=2*pi*r*t;
x0=s.*cos(ang);
y0=s.*sin(ang);
x=x0+s.*sin(ang);
y=y0-s.*cos(ang);
z=0;
grid on
plot(x,y)
set(h,'erasemode','none','markersize',22);
xlabel('x轴');ylabel('y轴');zlabel('z轴');
title('笛卡尔渐开线');
%% 球面螺旋线
clc,clear,close all
warning off
t=0:0.01:8*pi;
rho = 4;
theta = t*180;
phi = t*360*10;
x0 = (0+sin(phi)).*cos(theta);
y0 = (0+sin(phi)).*sin(theta);
z0 = rho.*cos(phi);
figure('color',[1,1,1])
plot3(x0,y0,z0,'.')
set(h,'erasemode','none','markersize',22);
xlabel('x轴');ylabel('y轴');zlabel('z轴');
title('球面螺旋线');

%% 环形螺旋线
clc,clear,close all
warning off
t=0:0.01:2*pi;
x=(50+10.*sin(t*360*15)).*cos(t*360);
y=(50+10.*sin(t*360*15)).*sin(t*360);
z=10.*cos(t*360*5);
plot3(x,y,z,'.')
set(h,'erasemode','none','markersize',22);
xlabel('x轴');ylabel('y轴');zlabel('z轴');
title('环形螺旋线');



