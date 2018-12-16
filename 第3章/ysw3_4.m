clc,clear,close all
warning off
ps=imread('ysw.jpg'); % 读原始图像
r = ps(:,:,1); % 红色分量
g = ps(:,:,2); % 绿色分量
b = ps(:,:,3); % 蓝色分量
rgb = b-g/2-r/2;  % 去除背景
bw = im2bw(rgb,0.2); % 二值化
bw = ~bw;   % 取反
bw2 = bwareaopen(bw,30); % 去除小块
%剔除背景后的RGB图像
ps = rgb2gray(ps); % 灰度化
ps = immultiply(ps,bw2); % 去掉背景
for i=1:size(ps,1)
    for j=1:size(ps,2)
        if ps(i,j)>0
            ps(i,j)=ps(i,j)+20;
        end
    end
end
background=imopen(ps,strel('disk',4));
background=double(background);
figure,imshow(background,[])
figure('color',[1,1,1])
surf(background(1:4:end,1:4:end))
zlim([0 256]);
set(gca,'Xdir','reverse');
set(gca,'Ydir','reverse');
box on
grid off
set(gca,'ZTick',zeros(1,0),'YTick',zeros(1,0),'XTick',zeros(1,0))
%% 左眼【48,64】，右眼【71,62】
figure('color',[1,1,1])
imshow(background,[])
hold on
plot(48,64,'r.','Markersize',20)
plot(71,62,'r.','Markersize',20)
dmin = sqrt((48-71)^2+(64-62)^2);
disp(['左右眼的最短路径为：', num2str(dmin)])
%%
figure('color',[1,1,1])
imshow(background,[])
hold on
plot(48,64,'r.','Markersize',20)
plot(71,62,'r.','Markersize',20)
plot([48,71],[64,62],'b-','linewidth',3')
%% surf，左眼【20,16,105】，右眼【13,16,72】
figure('color',[1,1,1])
mesh(background(1:4:end,1:4:end))
zlim([0 256]);
hold on
plot3(20,16,105,'r.','Markersize',50)
plot3(13,16,72,'r.','Markersize',50)
set(gca,'Xdir','reverse');
set(gca,'Ydir','reverse');
box on;grid off
%% 求解两眼的基于灰度值的最小距离
close all
[X1,Y1]= meshgrid(1:30,1:40);
Z1 = background(1:4:end,1:4:end);
figure('color',[1,1,1])
mesh(X1,Y1,Z1)
set(gca,'Xdir','reverse');
set(gca,'Ydir','reverse');
box on;grid off
sta = [20,16,105];  % 起点
des = [13,16,72];  % 终点
hold on
plot3(20,16,105,'r.','Markersize',50)
plot3(13,16,72,'r.','Markersize',50)
view([-39.5 70]);
%%
nX1 = size(X1);
kk=1;
for i=1:nX1(1,1)
    for j=1:nX1(1,2)
        X2(1,kk) = X1(i,j);  % 化成点
        Y2(1,kk) = Y1(i,j);
        Z2(1,kk) = Z1(i,j);
        kk=kk+1;
    end
end
%%
for i=1:length(X2)
    for j=1:length(X2)
        Distance(i,j)=sqrt( (X2(i)-X2(j))^2 + (Y2(i)-Y2(j))^2 + (Z2(i)-Z2(j))^2 );
        Distance(j,i)=Distance(i,j);
    end
end
%% 邻接矩阵
A=zeros(length(X2),length(X2)); % 构建邻接矩阵
% 第一行数据
for i = 1:nX1(1,2)-1
    A(i,i+1)=1;
    A(i,nX1(1,2)+i)=1;
    A(i,nX1(1,2)+i+1)=1; 
end
for i=2:nX1(1,1)-1 % 第二行到倒数第二行
    for j=2:nX1(1,2)-1 % 倒数第二列
        A( (i-1)*nX1(1,2)+j, (i-2)*nX1(1,2)+j ) = 1;    % 该点正上方点
        A( (i-1)*nX1(1,2)+j, (i-2)*nX1(1,2)+j-1 ) = 1;  % 该点正上方点，向左移一位
        A( (i-1)*nX1(1,2)+j, (i-2)*nX1(1,2)+j+1 ) = 1;  % 该点正上方点，向右移一位
        A( (i-1)*nX1(1,2)+j, (i-1)*nX1(1,2)+j-1 ) = 1;  % 该点行上，向左移一位
        A( (i-1)*nX1(1,2)+j, (i-1)*nX1(1,2)+j+1 ) = 1;  % 该点行上，向右移一位
        A( (i-1)*nX1(1,2)+j, (i)*nX1(1,2)+j ) = 1;      % 该点正下方点
        A( (i-1)*nX1(1,2)+j, (i)*nX1(1,2)+j-1 ) = 1;    % 该点正下方点，向左移一位
        A( (i-1)*nX1(1,2)+j, (i)*nX1(1,2)+j+1 ) = 1;    % 该点正下方点，向右移一位
    end
end
for i=1:length(X2)
    for j=1:length(X2)
        A(j,i)=A(i,j);
    end
end
%% 求最短路径
% 左眼【20,16,105】，右眼【13,16,72】
D=Distance.*A;          % 相连节点计算距离
D(find(D==0))=99999;    % 两点无边相连时赋值为inf
[Q_path, dmin] = dijkstra( 20*nX1(1,2)+16,13*nX1(1,2)+16 ,D);
disp(['左右眼的最短路径为：', num2str(dmin)])

figure('color',[1,1,1]),
mesh(X1,Y1,Z1)   % 三维曲面
xlabel('X');ylabel('Y');zlabel('Z')
hold on
plot3(20,16,105,'r.','Markersize',50)
plot3(13,16,72,'r.','Markersize',50)

for i=1:length(Q_path)
    row = ( Q_path(i) - mod(Q_path(i), nX1(1,2)) )/nX1(1,2);
    column = mod(Q_path(i),nX1(1,2));
    X3(i) = X1(column,row);
    Y3(i) = Y1(column,row);
    Z3(i) = Z1(column,row);
    plot3(X3(i),Y3(i),Z3(i),'r.','Markersize',40,'linewidth',3);
end
plot3(X3,Y3,Z3,'b-','Markersize',40,'linewidth',3);
set(gca,'Xdir','reverse');
set(gca,'Ydir','reverse');
view([-39.5 70]);

%%
% close all
figure('color',[1,1,1]),
background = imresize(background,[160,130]);
imshow(background,[])
% Z1 = imresize(Z1,[160,120]);
% imshow(Z1,[])
xlabel('X');ylabel('Y');zlabel('Z')
hold on
plot(4*X3(1),4*Y3(1),'r.','Markersize',30)
plot(4*X3(end),4*Y3(end),'r.','Markersize',30)

plot(4*X3,4*Y3,'b.','Markersize',10,'linewidth',3);
plot(4*X3,4*Y3,'b-','Markersize',10,'linewidth',3);
set(gca,'Xdir','reverse');
set(gca,'Ydir','reverse');
% view([-39.5 70]);





