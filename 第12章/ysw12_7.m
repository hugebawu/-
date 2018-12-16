clc,clear,close all
warning off
% 盲人下山
[X1,Y1]= meshgrid(-2:0.1:4,-2:0.1:4);
x1 = X1; x2 = Y1;
Z1 = 8*x1.^2+9*x2.^2-8.*x1.*x2-12*x1-6*x2;
figure('color',[1,1,1])
mesh(X1,Y1,Z1)
%% NxM 矩阵化为一行
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
%% 距离
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
% 起点【0.9,1.2,-9.63】，终点【0,0,0】
% 画图
figure('color',[1,1,1])
mesh(X1,Y1,Z1)
hold on
plot3(0.9,1.2,-9.63,'r.','Markersize',40)
plot3(0,0,0,'g.','Markersize',40)
hold off
%%
% 起点在30行33列，终点在21行21列
D=Distance.*A;          % 相连节点计算距离
D(find(D==0))=99999;    % 两点无边相连时赋值为inf
[Q_path, dmin] = dijkstra( 29*nX1(1,2)+33,20*nX1(1,2)+21 ,D);
disp(['最短路径为：', num2str(dmin)])
%%
figure('color',[1,1,1])
mesh(X1,Y1,Z1)
xlabel('X');ylabel('Y');zlabel('Z')
hold on
plot3(0.9,1.2,-9.63,'b.','Markersize',40)
plot3(0,0,0,'b.','Markersize',40)
for i=1:length(Q_path)
    row = ( Q_path(i) - mod(Q_path(i), nX1(1,2)) )/nX1(1,2);
    column = mod(Q_path(i),nX1(1,2));
    X3(i) = X1(column,row);
    Y3(i) = Y1(column,row);
    Z3(i) = Z1(column,row);
    plot3(X3(i),Y3(i),Z3(i),'r.','Markersize',40,'linewidth',3);
end
%%
figure('color',[1,1,1])
mesh(X1,Y1,Z1)
xlabel('X');ylabel('Y');zlabel('Z')
hold on
plot3(0.9,1.2,-9.63,'r.','Markersize',40)
plot3(0,0,0,'g.','Markersize',40)

plot3(X3,Y3,Z3,'b-','Markersize',40,'linewidth',3);
set(gca,'Xdir','reverse');
set(gca,'Ydir','reverse');






