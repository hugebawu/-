clc,clear,close all
warning off
%% 定义常量
pt=20;     % 阅读器的发射功率
gt=5;
gtag=8;
D=1;       % 方向性系数
a=0.328;   % 波长
R=(pt*gt*gtag*a^2*D)/(16*pi^2);
%定义各坐标值
tagtag=[3,3,1];  % 物体坐标
reader=[8,8,2;2,8,2;2,3,2;8,3,2; 5,5,1; 7,8,0;2,8,0;2,2,0;8,2,0];%5个阅读器 的参考坐标
x1 = 0:1:10; y1 = 0:1:10; 
z1=zeros(size(x1,2)); z2 = z1+1; z3=z2+1;
[X1,Y1] = meshgrid(x1,y1);

figure('color',[1,1,1])
surf(X1,Y1,z1,'FaceColor',[0 1 1])
hold on
surf(X1,Y1,z2,'FaceColor',[0 1 0.5]);
surf(X1,Y1,z3,'FaceColor',[0 1 1]);
xlabel('x'),ylabel('y'),zlabel('z')
box on
view([-71.5 20]);
plot3(tagtag(:,1),tagtag(:,2),tagtag(:,3),'k.','markersize',50)
plot3(reader(:,1),reader(:,2),reader(:,3),'b.','markersize',30)

%% 确定四个最近邻圆心坐标
d22=zeros(1,size(reader,1));   % 初始化
%求距离
for j=1:size(reader,1)
    d22(1,j)=sqrt((tagtag(1,1)-reader(j,1))^2+(tagtag(1,2)-reader(j,2))^2+(tagtag(1,3)-reader(j,3))^2); 
end
%计算值
PPtag2=R./(d22.^2);          % 定位标签在9个不同点时强度
Ptag2 = awgn(PPtag2,49.1);   % 加入白噪声
d2=sqrt(R./Ptag2);    
%取Ptag中最大的前四个
Ptag22=Ptag2;
for i=1:4
     [value(i) numb(i)]=max(Ptag22);
     Ptag22(numb(i))=-10;
end
value;   % 最大的前四个值
numb;    % 最大值对应的位置序号

O=reader(numb,:);%圆心坐标
O1=O(1,:); %第1个圆心坐标
O2=O(2,:); %第2个圆心坐标
O3=O(3,:); %第3个圆心坐标
O4=O(4,:); %第4个圆心坐标

figure('color',[1,1,1])
surf(X1,Y1,z1,'FaceColor',[0 1 1])
hold on
surf(X1,Y1,z2,'FaceColor',[0 1 0.5]);
surf(X1,Y1,z3,'FaceColor',[0 1 1]);
plot3(tagtag(:,1),tagtag(:,2),tagtag(:,3),'k.','markersize',50)
plot3(reader(:,1),reader(:,2),reader(:,3),'b.','markersize',30)
plot3(O(:,1),O(:,2),O(:,3),'r.','markersize',30)
view([-71.5 20]); box on

%% 画球体
%求半径
r1=d2(numb(1));  [xb1,yb1,zb1] = ball_x(O1,r1);  % 第1个圆心坐标下的球体
r2=d2(numb(2));  [xb2,yb2,zb2] = ball_x(O2,r2);  % 第1个圆心坐标下的球体
r3=d2(numb(3));  [xb3,yb3,zb3] = ball_x(O3,r3);  % 第1个圆心坐标下的球体
r4=d2(numb(4));  [xb4,yb4,zb4] = ball_x(O4,r4);  % 第1个圆心坐标下的球体

figure('color',[1,1,1])
surf(X1,Y1,z1,'FaceColor',[0 1 1])
hold on
surf(X1,Y1,z2,'FaceColor',[0 1 0.5]);
surf(X1,Y1,z3,'FaceColor',[0 1 1]);
plot3(tagtag(:,1),tagtag(:,2),tagtag(:,3),'k.','markersize',50)
plot3(reader(:,1),reader(:,2),reader(:,3),'b.','markersize',30)
plot3(O(:,1),O(:,2),O(:,3),'r.','markersize',30)
view([-71.5 20]); box on
surf(xb1,yb1,zb1);  % 第1个圆心坐标下的球体
surf(xb2,yb2,zb2);  % 第2个圆心坐标下的球体
surf(xb3,yb3,zb3);  % 第3个圆心坐标下的球体
surf(xb4,yb4,zb4);  % 第4个圆心坐标下的球体
shading interp


%% 相交体绘制
% [xj12,yj12,zj12] = intersc_body(O1,r1,O2,r2); % 球1和球2相交体
% [xj13,yj13,zj13] = intersc_body(O1,r1,O3,r3); % 球1和球3相交体
% [xj14,yj14,zj14] = intersc_body(O1,r1,O4,r4); % 球1和球4相交体
% [xj23,yj23,zj23] = intersc_body(O2,r2,O3,r3); % 球2和球3相交体
% [xj24,yj24,zj24] = intersc_body(O2,r2,O4,r4); % 球2和球4相交体
% [xj34,yj34,zj34] = intersc_body(O3,r3,O4,r4); % 球3和球4相交体
% save xj.mat xj12 yj12 zj12 xj13 yj13 zj13 xj14 yj14 zj14 xj23 yj23 zj23 xj24 yj24 zj24 xj34 yj34 zj34
load('xj.mat')

figure('color',[1,1,1])
surf(X1,Y1,z1,'FaceColor',[0 1 1])
hold on
surf(X1,Y1,z2,'FaceColor',[0 1 0.5]);
surf(X1,Y1,z3,'FaceColor',[0 1 1]);
plot3(tagtag(:,1),tagtag(:,2),tagtag(:,3),'k.','markersize',50)
plot3(reader(:,1),reader(:,2),reader(:,3),'b.','markersize',30)
plot3(O(:,1),O(:,2),O(:,3),'r.','markersize',30)
view([11.5 32]); box on

surf(xb1,yb1,zb1,'facecolor',[1,0,0],'edgecolor','none','alphadata',0.5-abs(zb1-1.5),'facealpha','interp','AmbientStrength',1,'DiffuseStrength',0,'SpecularStrength',0);  % 第1个圆心坐标下的球体
surf(xb2,yb2,zb2,'facecolor',[0,1,0.5],'edgecolor','none','alphadata',0.5-abs(zb2-1.5),'facealpha','interp','AmbientStrength',1,'DiffuseStrength',0,'SpecularStrength',0);  % 第2个圆心坐标下的球体
surf(xb3,yb3,zb3,'facecolor',[1,0,0.5],'edgecolor','none','alphadata',0.5-abs(zb3-1.5),'facealpha','interp','AmbientStrength',1,'DiffuseStrength',0,'SpecularStrength',0);  % 第3个圆心坐标下的球体
surf(xb4,yb4,zb4,'facecolor',[0,0,1],'edgecolor','none','alphadata',0.5-abs(zb4-1.5),'facealpha','interp','AmbientStrength',1,'DiffuseStrength',0,'SpecularStrength',0);  % 第4个圆心坐标下的球体

plot3(xj12,yj12,zj12,'r.','markersize',5)  % 球1和球2相交体
plot3(xj13,yj13,zj13,'g.','markersize',5)  % 球1和球3相交体
plot3(xj14,yj14,zj14,'b.','markersize',5)  % 球1和球4相交体
plot3(xj23,yj23,zj23,'c.','markersize',5)  % 球2和球3相交体  无相交
plot3(xj24,yj24,zj24,'y.','markersize',5)  % 球2和球4相交体
plot3(xj34,yj34,zj34,'.','markersize',5,'Color',[1 0 1])  % 球3和球4相交体

%% 单独显示相交体
figure('color',[1,1,1])
surf(X1,Y1,z1,'FaceColor',[0 1 1])
hold on
surf(X1,Y1,z2,'FaceColor',[0 1 0.5]);
surf(X1,Y1,z3,'FaceColor',[0 1 1]);
plot3(tagtag(:,1),tagtag(:,2),tagtag(:,3),'k.','markersize',50)
plot3(reader(:,1),reader(:,2),reader(:,3),'b.','markersize',30)
plot3(O(:,1),O(:,2),O(:,3),'r.','markersize',30)
view([11.5 32]); box on

plot3(xj12,yj12,zj12,'r.','markersize',5)  % 球1和球2相交体
plot3(xj13,yj13,zj13,'.','markersize',5,'Color',[0.5 0.5 0.5])  % 球1和球3相交体
plot3(xj14,yj14,zj14,'b.','markersize',5)  % 球1和球4相交体
plot3(xj23,yj23,zj23,'.','markersize',5,'Color',[0.5 0 0.5])  % 球2和球3相交体  无相交
plot3(xj24,yj24,zj24,'y.','markersize',5)  % 球2和球4相交体
plot3(xj34,yj34,zj34,'.','markersize',5,'Color',[1 0 1])  % 球3和球4相交体
% %% 提取坐标，以x轴位参考轴
% [xj12_x1,xj12_num]=max(xj12); xj12_y1 = yj12(xj12_num); xj12_z1 = zj12(xj12_num);  sp11=[xj12_x1,xj12_y1,xj12_z1];
% [xj12_x2,xj12_num]=min(xj12); xj12_y2 = yj12(xj12_num); xj12_z2 = zj12(xj12_num);  sp12=[xj12_x2,xj12_y2,xj12_z2];
% [xj13_x1,xj12_num]=max(xj13); xj13_y1 = yj13(xj12_num); xj13_z1 = zj13(xj12_num);  sp13=[xj13_x1,xj13_y1,xj13_z1];
% [xj13_x2,xj12_num]=min(xj13); xj13_y2 = yj13(xj12_num); xj13_z2 = zj13(xj12_num);  sp14=[xj13_x2,xj13_y2,xj13_z2];
% [xj14_x1,xj12_num]=max(xj14); xj14_y1 = yj14(xj12_num); xj14_z1 = zj14(xj12_num);  sp15=[xj14_x1,xj14_y1,xj14_z1];
% [xj14_x2,xj12_num]=min(xj14); xj14_y2 = yj14(xj12_num); xj14_z2 = zj14(xj12_num);  sp16=[xj14_x2,xj13_y2,xj14_z2];
% [xj23_x1,xj12_num]=max(xj23); xj23_y1 = yj23(xj12_num); xj23_z1 = zj23(xj12_num);  sp17=[xj23_x1,xj23_y1,xj23_z1];
% [xj23_x2,xj12_num]=min(xj23); xj23_y2 = yj23(xj12_num); xj23_z2 = zj23(xj12_num);  sp18=[xj23_x2,xj23_y2,xj23_z2];
% [xj24_x1,xj12_num]=max(xj24); xj24_y1 = yj24(xj12_num); xj24_z1 = zj24(xj12_num);  sp19=[xj24_x1,xj24_y1,xj24_z1];
% [xj24_x2,xj12_num]=min(xj24); xj24_y2 = yj24(xj12_num); xj24_z2 = zj24(xj12_num);  sp110=[xj24_x2,xj24_y2,xj24_z2];
% [xj34_x1,xj12_num]=max(xj34); xj34_y1 = yj34(xj12_num); xj34_z1 = zj34(xj12_num);  sp111=[xj34_x1,xj34_y1,xj34_z1];
% [xj34_x2,xj12_num]=min(xj34); xj34_y2 = yj34(xj12_num); xj34_z2 = zj34(xj12_num);  sp112=[xj34_x2,xj34_y2,xj34_z2];
% 重心坐标
xj12_x = mean(xj12); yj12_y = mean(yj12); zj12_z = mean(zj12); sp1=[xj12_x,yj12_y,zj12_z];
xj13_x = mean(xj13); yj13_y = mean(yj13); zj13_z = mean(zj13); sp2=[xj13_x,yj13_y,zj13_z];
xj14_x = mean(xj14); yj14_y = mean(yj14); zj14_z = mean(zj14); sp3=[xj14_x,yj14_y,zj14_z];
xj23_x = mean(xj23); yj23_y = mean(yj23); zj23_z = mean(zj23); sp4=[xj23_x,yj23_y,zj23_z];
xj24_x = mean(xj24); yj24_y = mean(yj24); zj24_z = mean(zj24); sp5=[xj24_x,yj24_y,zj24_z];
xj34_x = mean(xj34); yj34_y = mean(yj34); zj34_z = mean(zj34); sp6=[xj34_x,yj34_y,zj34_z];
sp =[sp1',sp2',sp3',sp4',sp5',sp6']


