clc,clear,close all
warning off
% Galton钉板试验
% 设置参数
m = 100;
n=6;
y0=2; 
ballnum = zeros(1,n+1);
p=0.5;
q=1-p;
figure('color',[1,1,1])
for i=n+1:-1:1  % 创建钉子的坐标x,y
    x(i,1)=0.5*(n-i+1);
    y(i,1) = (n-i+1)+y0;
    for j=2:i
        x(i,j)=x(i,1)+(j-1)*1;
        y(i,j)=y(i,1);
    end
end
mm =moviein(m);
for i=1:m
    s=rand(1,n); % 产生n个随机数
    xi=x(1,1);
    yi=y(1,1);
    k=1;l=1;
    for j=1:n
        plot(x(1:n,:),y(1:n,:),'o',x(n+1,:),y(n+1,:),'.-'); % 画钉子的位置
        axis([-2,n+2,0,y0+n+1])
        hold on
        k=k+1;
        if s(j)>p
            l=l+0;  % 小球左移
        else 
            l=l+1; % 小球右移
        end 
        xt=x(k,l);
        yt=y(k,l);
        h = plot([xi,xt],[yi,yt]);
        axis([-2,n+2,0,y0+n+1]);  % 化小球运动轨迹
        xi = xt;
        yi = yt;
    end
    ballnum(l)=ballnum(l)+1;  % 计算
    ballnum1 = 3*ballnum./m;
    bar([0:n],ballnum1)
    axis([-2,n+2,0,y0+n+1]) % 画各格子的频率
    mm(i)=getframe;
    hold off
end
movie(mm,1) % 播放动画一次
        
    

