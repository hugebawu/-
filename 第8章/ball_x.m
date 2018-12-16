function [x,y,z]=ball_x(xyz,r)
x1 = xyz(1,1); % Բ��x����
y1 = xyz(1,2); % Բ��y����
z1 = xyz(1,3); % Բ��z����
u = 0:0.05*pi:2*pi;
v = 0:0.05*pi:2*pi;
[u,v] = meshgrid(u,v);
x = x1 + r.*cos(u).*cos(v);
y = y1 + r.*cos(u).*sin(v);
z = z1 + r.*sin(u);
% surf(x,y,z)



