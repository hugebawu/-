clc,clear,close all
warning off
% 盲人下山
a=-2;b=4;
xmin=a;xmax=b;ymin=a;ymax=b;
x1=linspace(xmin,xmax,100);
x2=linspace(ymin,ymax,100);
[X1,X2]=meshgrid(x1,x2);
[Z,DZ1,DZ2]=jt(X1,X2);
axis([xmin xmax ymin ymax]);
axis equal
plot([1.46808510638298],[1.148936170212776],'o')
axis([xmin xmax ymin ymax]);
hold on
disp('鼠标左键选取等高线')
disp('停止下山')
button=1;
x=[];y=[];
while button==1
    [xi,yi,button]=ginput(1);
    plot([xi],[yi],'r.','markersize',10);
    hold on;
    [zi,dz1,dz2]=jt(xi,yi);
    v=zi;
    contour(X1,X2,Z,[v v],'-');
    axis([xmin xmax ymin ymax]);
    x=[x,xi];y=[y,yi];
    H_line2=plot(x,y);
    set(H_line2,'color','red','linewidth',2);
    xt=xi-dz1;yt=yi-dz2;
    H_line=plot([xi xt],[yi yt],'k:','linewidth',1);
end


