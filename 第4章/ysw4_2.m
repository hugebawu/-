clc,clear,close all
warning off
im = imread('hubei.bmp');
figure(1),imshow(im)
% 城市点坐标
x1 = 312; y1 = 95;  % 十堰
x2 = 474; y2 = 181; % 襄樊市
x3 = 144; y3 = 499; % 恩施土家族苗族自治州
x4 = 385; y4 = 387; % 宜昌市
x5 = 488; y5 = 342; % 荆门市
x6 = 503; y6 = 444; % 荆州市
x7 = 639; y7 = 224; % 随州市
x8 = 713; y8 = 343; % 孝感市
x9 = 760; y9 = 395; % 武汉市
x10 = 840; y10 = 406; % 黄冈市
x11 = 828; y11 = 418; % 鄂州市
x12 = 862; y12 = 449; % 黄石市
x13 = 769; y13 = 508; % 咸宁市
xy = [x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13;
    y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13]';  % 城市的位置坐标
n = 13;%城市的数量
hold on
plot(xy(:,1),xy(:,2),'r.','Markersize',20)

%%
popSize = 60;  % 种群的大小，一般被4整除
numIter = 1e4; % 算法迭代的次数
showProg = 1;  % 如果满足条件，执行遗传算法的步骤
showResult = 1;% 如果满足条件，执行遗传算法的结果
a = meshgrid(1:n);
dmat = reshape(sqrt(sum((xy(a,:)-xy(a',:)).^2,2)),n,n);%城市之间的距离/成本
[optRoute,minDist] = tsp_ga(xy,dmat,popSize,numIter,showProg,showResult);
%% Output:
% optRoute 遗传算法得出的最优路径
% minDist 最优路径下的成本值或距离值
%%
figure,
imshow(im);
for i=1:n
    hold on
    plot(xy(:,1),xy(:,2),'r.','Markersize',20);
    text(xy(i,1),xy(i,2)+0.08,num2str(i));
end
for i=1:n-1
    plot([xy(optRoute(1,i),1),xy(optRoute(1,i+1),1)],[xy(optRoute(1,i),2),xy(optRoute(1,i+1),2)],'r-','linewidth',2)
    hold on
end
for i=n
    plot([xy(optRoute(1,i),1),xy(optRoute(1,1),1)],[xy(optRoute(1,i),2),xy(optRoute(1,1),2)],'r-','linewidth',2)
    hold on
end





