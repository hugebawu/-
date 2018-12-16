clc,clear,close all
warning off
%计算各顶点坐标
[B,football_pos] = bucky();
 
%绘半透明球体
[x,y,z]=sphere(30);
figure('color',[1,1,1])
surf(x,y,z,'facecolor',[1 1 0],'edgecolor','none','facealpha',0.7);
axis equal
view(3,3)
hold on
 
%绘各顶点
plot3(football_pos(:,1),football_pos(:,2),football_pos(:,3),'*');
 
%计算棱长
Edge_Vector = football_pos(1,:)-football_pos(2,:);
Edge_Length = Edge_Vector * Edge_Vector';
Error = 0.0005;
 
%距离等于棱长的两点显然是棱，将两点连线
for i=1:length(football_pos)-1
    for j=i+1:min(j+15,length(football_pos))
        Vector = football_pos(i,:)-football_pos(j,:);
        Length = Vector*Vector';
        if abs(Length-Edge_Length)<=Error
            x = [football_pos(i,1),football_pos(j,1)];
            y = [football_pos(i,2),football_pos(j,2)];
            z = [football_pos(i,3),football_pos(j,3)];
            line(x,y,z)
        end
    end
end


