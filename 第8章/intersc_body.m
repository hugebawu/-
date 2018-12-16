function [x,y,z] = intersc_body(c1,r1,c2,r2)
% c1 ��һ������
% r1 ��һ����뾶
% c2 �ڶ�������
% r2 �ڶ�����뾶

% ��һ����
x1 = c1(1,1); %  ��һ������x����
y1 = c1(1,2); %  ��һ������y����
z1 = c1(1,3); %  ��һ������z����
u = 0:0.005*pi:2*pi;
v = 0:0.005*pi:2*pi;
[u,v] = meshgrid(u,v);
x11 = x1 + r1.*cos(u).*cos(v);
y11 = y1 + r1.*cos(u).*sin(v);
z11 = z1 + r1.*sin(u);

% �ڶ�����
x2 = c2(1,1); %  ��һ������x����
y2 = c2(1,2); %  ��һ������y����
z2 = c2(1,3); %  ��һ������z����
x22 = x2 + r2.*cos(u).*cos(v);
y22 = y2 + r2.*cos(u).*sin(v);
z22 = z2 + r2.*sin(u);

xyz1=[];
xyz2=[];

n = size(x11);
for i=1:n(1,1)
    for j=1:n(1,2)
        d1 = sqrt( (x11(i,j)-x2).^2 + (y11(i,j)-y2).^2 + (z11(i,j)-z2).^2 );
        d2 = sqrt( (x22(i,j)-x1).^2 + (y22(i,j)-y1).^2 + (z22(i,j)-z1).^2 );
        if d1<=r2
            dxyz1 = [x11(i,j),y11(i,j),z11(i,j)];
            xyz1=[xyz1;dxyz1];
        end
        if d2<=r1
            dxyz2 = [x22(i,j),y22(i,j),z22(i,j)];
            xyz2=[xyz2;dxyz2];            
        end
    end
end
xyz = [xyz1;xyz2];
if isempty(xyz)
   x=[];y=[];z=[];
else 
   x = xyz(:,1); y = xyz(:,2); z = xyz(:,3);
end
        
        
        

