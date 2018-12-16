clc,clear,close all
warning off
hf=figure('name','百花争艳图');
axis([0 22 0 16]);
axis equal
title('百花歌盛世');
axis off
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  画的树干
gx=[0 1 2 3 4 4.2 5 5.1 6 7 8 8.2 8.7 9 9.2 10 10.5 11 11.5 11.7 12.3 12.5 13 13.5 14];
gy=[0 1.8 3.1 3.3 3.8 3.9 4 4.05 4.1 4.3 4.55 4.6 4.75 5 5.65 6.2 6.8 7.4 8 8.4 9 9.3 9.87 10.25 10.8];

p=polyfit(gx,gy,4);
gxx=linspace(0,16,100);
gyy=polyval(p,gxx);

plot(gxx,gyy,'linewidth',5,'color',[0.1 0.9 0]);

c1x=[2 2.3 2.5 2.6 2.55 2.5 2.4 2.3 2.2 2.1 1.8 1.5 1.2];
c1y=[3.1 3.7 4.1 5 5.4 5.6 5.8 5.9 6 6.1 6.3 6.8 7.2];
plot(c1x,c1y,'linewidth',2.5,'color','c');

c1x1=[2.5 2.6 2.7 2.8 2.9 3 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8];
c1y1=[4.1 4.4 4.6 4.85 5 5.2 5.3 5.4 5.55 5.6 5.7 5.76 5.82 5.9];
plot(c1x1,c1y1,'linewidth',2.5,'color','r');


c2x=[4 4.3 4.4 4.5 5 5.1 5.3 5.5 5.6 5.8 6 6.3 6.6 6.8 7 7.1 7.2 7.3 7.5 7.7 7.9 8 8.1 8.2 ];
c2y=[3.78 3.78 3.75 3.73 3.7 3.68 3.67 3.6 3.58 3.54 3.5 3.4 3.3 3.15 3 2.9 2.8 2.7 2.5 2.35 2.1 2 1.8 1.6];
plot(c2x,c2y,'linewidth',2.5,'color','b');

c3x=[4.8 5.1 5.2 5.3 5.5 5.7 5.8 5.9 6 6.1 6.2 6.4 6.5 6.6 6.65 6.66 6.67 6.68 6.69 6.7 6.65 6.6 6.55 6.5 6.45 6.4];
c3y=[3.85 4.05 4.1 4.17 4.3 4.6 4.74 4.96 5.1 5.4 5.5 6 6.2 6.66 6.76 6.86 7 7.1 7.2 7.4 7.55 7.68 7.8 8 8.1 8.2];
plot(c3x,c3y,'linewidth',2.5,'color','r');

c3x1=[6.1 6.2 6.17 6.15 6.1 6.05 6 5.9 5.8 5.6 5.5 5.4 5.3 5.2 5.1 5 4.9 4.8 4.7 4.6 4.5 4.2 4];
c3y1=[5.4 5.5 5.6 5.65 5.7 5.8 6 6.2 6.45 6.8 6.93 7.08 7.2 7.3 7.4 7.5 7.51 7.52 7.7 8 8.5 9 9.5];
plot(c3x1,c3y1,'linewidth',2.5,'color','g');

c3x2=[5.9 6 6.1 6.2 6.4 6.5 6.6 6.7 6.8 6.9 7 7.1 7.2 7.3 7.4 7.5 7.6];
c3y2=[4.96 5.05 5.15 5.27 5.54 5.67 5.8 6 6.08 6.2 6.3 6.4 6.5 6.62 6.7 6.8 6.85];
plot(c3x2,c3y2,'linewidth',2.5,'color','b');

%c5x=c3x+3.6;
%c5y=c3y+1.2;
%plot(c5x,c5y); 

c5x=[5.3 5.5 5.7 5.8 5.9 6 6.1 6.2 6.4 6.5 6.6 6.65 6.66 6.67 6.68 6.69 6.7 6.65 6.6 6.55 6.5 6.45 6.4]+3.6;
c5y=[4.11 4.3 4.6 4.74 4.96 5.1 5.4 5.5 6 6.2 6.66 6.76 6.86 7 7.1 7.2 7.4 7.55 7.68 7.8 8 8.1 8.2]+1.2;
plot(c5x,c5y,'linewidth',2.5,'color','m');

c5x1=c3x1+3.6;
c5y1=c3y1+1.2;
plot(c5x1,c5y1,'linewidth',2.5,'color','c');

%c5x2=c3x2+3.6;
%c5y2=c3y2+1.2;
%plot(c5x2,c5y2);

c4x=[8.2 8.5 9 9.5 10 10.2 ];
c4y=[4.6 4.4 4.2 3.7 3.3 3 ];
p4=polyfit(c4x,c4y,4);
c4xx=linspace(8.2,12.2,20);
c4yy=polyval(p4,c4xx);
plot(c4xx,c4yy,'linewidth',2.5,'color','g');


c4x1=[8.9 9 9.1 9.2 9.3 9.5];
c4y1=[2.8 2.85 2.9 3 3.1 3.7];
p41=polyfit(c4x1,c4y1,4);
c4xx1=linspace(8.9,9.5,20);
c4yy1=polyval(p41,c4xx1);
plot(c4xx1,c4yy1,'linewidth',2.5,'color','m');

c4x2=[9.5 9.8 10.4 10.7 10.8 11 12];
c4y2=[3.7 3.68 3.64 3.6 3.7 3.8 3.9];
p42=polyfit(c4x2,c4y2,4);
c4xx2=linspace(9.5,12,20);
c4yy2=polyval(p42,c4xx2);
plot(c4xx2,c4yy2,'linewidth',2.5,'color','k');

c6x=[10.5 11 11.5 12 12.5 13 13.5 14];
c66y=[6.3 6.4 6.67 6.9 7.2 7.5 7.9 8.3]+0.5;
c6y=c66y;
p6=polyfit(c6x,c6y,4);
c6xx=linspace(10.5,14,20);
c6yy=polyval(p6,c6xx);
plot(c6xx,c6yy,'linewidth',2.5,'color',[0.2 0.6 0]);

c6x1=[12 12.5 13 13.3 13.5 13.7 14];
c66y1=[6.9 6.86 6.8 6.7 6.6 6.4 6]+0.5;
c6y1=c66y1;
p61=polyfit(c6x1,c6y1,4);
c6xx1=linspace(12,14.5,20);
c6yy1=polyval(p61,c6xx1);
plot(c6xx1,c6yy1,'linewidth',2.5,'color',[0.7 0.2 0.1]);


c7x=[11.9 12 12.2 12.54 12.8 12.9 13];
c77y=[8.1 8.5 9 10 10.5 11 12]+0.4;
c7y=c77y;
p7=polyfit(c7x,c7y,4);
c7xx=linspace(11.9,13,20);
c7yy=polyval(p7,c7xx);
plot(c7xx,c7yy,'linewidth',2.5,'color',[1 0 0]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 画的树干


%%%%%%%%%%%%%%%%%各顶点
dc1x=1.2;
dc1y=7.2;
dc2x=8.2597;
dc2y=1.5469;
dc3x=6.4016;
dc3y=8.1662;
dc4x=12.2097;
dc4y=1.7260;
dc5x=9.9726;
dc5y=9.3565;
dc6x=13.9210;
dc6y=8.7469;
dc7x=12.9919;
dc7y=12.3469;
dgx=16.0694;
dgy=11.3598;

dc1x1=3.7016;
dc1y1=5.8436;
dc3x1=4;
dc3y1=9.5;
dc4x1=8.9274;
dc4y1=2.7952;
dc5x1=7.5645;
dc5y1=10.6292;
dc6x1=14.5323;
dc6y1=5.2099;

dc3x2=7.5629;
dc3y2=6.8017;
dc4x2=11.9758;
dc4y2=3.9275;
%%%%%%%%%%%%%%%%%%% 画各顶点

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%画花
 
%15
aa15=linspace(0,4*pi,600);
a15=aa15+pi/4;
phi15=3*sin(a15)+3.5*cos(10*a15).*cos(8*a15);
x15=phi15.*cos(aa15)/2+dgx;
y15=phi15.*sin(aa15)/2+dgy;
plot(x15,y15,'color',[1 0 0],'linewidth',1.5);
%15

%14
t14=linspace(0,1,3000); 
r14=t14*20;
a14=t14*360*90;
b14=t14*360*10; 
x14=r14.*sind(a14).*cosd(b14)/8+dc7x;
y14=r14.*sind(a14).*sind(b14)/8+dc7y; 
plot(x14,y14,'color','c');
%14

%3
t3=linspace(0,0.1,1000);
x3=(cos(t3*360)+cos(3*t3*360))/2+dc2x;
y3=(sin(t3*360)+sin(5*t3*360))/2+dc2y; 
plot(x3,y3,'color','m','linewidth',1.5);
%3

%13
a13=linspace(0,2*pi,400);
phi13=0.2*sin(3*a13)+sin(4*a13)+2*sin(5*a13)+1.9*sin(7*a13)-0.2*sin(9*a13)+sin(11*a13);
x13=phi13.*cos(a13)/2+dc6x1;
y13=phi13.*sin(a13)/2+dc6y1;
plot(x13,y13,'color','m','linewidth',1.5);
%13

%7
t7=linspace(0,8*pi,2000);
r7=4*sqrt(t7/pi/10); 
rr7=-4*sqrt(t7/pi/10); 
x7=r7.*cos(t7)/3+dc4x;
y7=r7.*sin(t7)/3+dc4y;
xx7=rr7.*cos(t7)/3+dc4x;
yy7=rr7.*sin(t7)/3+dc4y;  
plot(x7,y7,'color','m','linewidth',1.2);
plot(xx7,yy7,'color','c','linewidth',1.2);
%7

%8
tt8=linspace(0,2*pi,1001);
t8=tt8(1:1000);
x8=cos(t8)/2+dc4x1;
y8=sin(t8)/2+dc4y1;
fill(x8,y8,'r');
%8

%9
a9=linspace(0,1,2000); 
t9=360*a9;
r9=10+(3*sind(t9*2.5)).^2; 
x9=r9.*cosd(t9)/20+dc4x2;
y9=r9.*sind(t9)/20+dc4y2; 
plot(x9,y9,'g','linewidth',15);
%9

%12
t12=linspace(0,20*pi,500); 
theta12=t12;
a12=5;
b12=3;
c12=5;
x12=((a12+b12)*cos(theta12)-c12*cos((a12/b12+1)*theta12))/12+dc6x;
y12=((a12+b12)*sin(theta12)-c12*sin((a12/b12+1)*theta12))/12+dc6y; 
plot(x12,y12,'color','b','linewidth',1.3);
%12

%10
t10=linspace(0,8*pi,200); 
theta10=t10;
x10=(2+(10-5)*cos(theta10)+6*cos((10/6-1)*theta10))/8+dc5x;
y10=(2+(10-5)*sin(theta10)-6*sin((10/6-1)*theta10))/8+dc5y;
plot(x10,y10,'color','g','linewidth',1.5);
%10

%11
a11=linspace(0,1,1000); 
t11=360*a11;
r11=10-(3*sind(t11*3)).^2; 
x11=r11.*cosd(t11)/6+dc5x1;
y11=r11.*sind(t11)/6+dc5y1; 
plot(x11,y11,'color','b','linewidth',2);
%11

%6
a6=linspace(0,1,1000); 
t6=360*a6;
r6=100+50*cosd(5*t6); 
x6=r6.*cosd(t6)/150+dc3x2;
y6=r6.*sind(t6)/150+dc3y2; 
plot(x6,y6,'color','c','linewidth',10);
%6

%4
t4=linspace(0,1,1000); 
a4=t4*360;
r4=1.5*cosd(50*a4)+1; 
x4=r4.*cosd(a4)/3+dc3x;
y4=r4.*sind(a4)/3+dc3y; 
plot(x4,y4,'color',[1 0 0]);
%4

%2
t2=linspace(0,20*pi,1000);
a2=5;
b2=8;
theta2=t2;
x2=((a2+b2)*cos(theta2)-b2*cos((a2/b2+1)*theta2))/15+dc1x1;
y2=((a2+b2)*sin(theta2)-b2*sin((a2/b2+1)*theta2))/15+dc1y1;
plot(x2,y2,'color','m','linewidth',1.5);
%2

%1
t1=linspace(0,10*pi,1000); 
a1=t1;
r1=(a1/(2*pi)).*sin(5*a1)+8;
x1=r1.*cos(a1)/10+dc1x;
y1=r1.*sin(a1)/10+dc1y;
plot(x1,y1,'color','b','linewidth',1.2);
%1

%5
a5=linspace(0,4*pi,600);
phi5=3*sin(a5)+3.5*cos(10*a5).*cos(8*a5);
x5=phi5.*cos(a5)/2+dc3x1;
y5=phi5.*sin(a5)/2+dc3y1;
plot(x5,y5,'color','g','linewidth',1.5);
%5

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 画花完毕

%% 画兔子
dtx=19;
dty=3;
dytx=17.3244;
dyty=2.7524;
tt=linspace(0,1,1000); 
at=tt*360-90;
rt=cosd(360*(tt./(1+tt.^(6.5)))*6.*tt)*3.5+5; 
xt=rt.*cosd(at)/3+dtx;
yt=rt.*sind(at)/3+dty; 
plot(xt,yt,'color','b','linewidth',6);
line(dytx,dyty,'markersize',50,'linestyle','.','color','r');
line(dytx,dyty,'markersize',40,'linestyle','.','color','g');
%% 画兔子完毕

%% 画蝴蝶
aah=linspace(0,2*pi,400);
ah=aah-pi/4;
phih=0.2*sin(3*ah)+sin(4*ah)+2*sin(5*ah)+1.9*sin(7*ah)-0.2*sin(9*ah)+sin(11*ah);
xh=phih.*cos(aah)/1.5+19;
yh=phih.*sin(aah)/1.5+8;
plot(xh,yh,'g');
%%  画蝴蝶完毕

%% 画月亮
ty=linspace(0,1,1000);
xy=(cos(ty*360)+cos(2*ty*360))/2+21;
yy=(sin(ty*360)*2+sin(ty*360)*2)/2+13.5; 
plot(xy,yy,'color','y','linewidth',10);
%% 画月亮完毕




