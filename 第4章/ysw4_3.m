clc,clear,close all
warning off
a=pi/2:-0.01*pi:0;
d=100; k=2;
r=d*abs(tan(a/2).^k./sin(a));
polar(a,r,'-o')
hold on
k=1;
r= d*abs(tan(a/2).^k./sin(a));
polar(a,r,'.') 
k=5
r=d*abs(tan(a/2).^k./sin(a));
polar(a,r,'-^') 
k=0.8;
r=d*abs(tan(a/2).^k./sin(a));
polar(a,r,'-*') 
legend('k=2','k=1','k=5','k=0.8')