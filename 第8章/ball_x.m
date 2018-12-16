function [x,y,z]=ball_x(xyz,r)
x1 = xyz(1,1); % 圆心x坐标
y1 = xyz(1,2); % 圆心y坐标
z1 = xyz(1,3); % 圆心z坐标
u = 0:0.05*pi:2*pi;
v = 0:0.05*pi:2*pi;
[u,v] = meshgrid(u,v);
x = x1 + r.*cos(u).*cos(v);
y = y1 + r.*cos(u).*sin(v);
z = z1 + r.*sin(u);
% surf(x,y,z)



