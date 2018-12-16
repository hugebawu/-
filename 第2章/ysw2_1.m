% �������
clc,clear all,close all;

% ��������
n=4;
t=0:0.02:n*pi;
a=8;
b=1;

% 3D������ʵ
world=vrworld('my_plane.wrl', 'new');
open(world);
fig=vrfigure(world);
set(fig, 'Viewpoint', 'Far View');
airpln=vrnode(world, 'Plane');
vector_z=[0 0 1];

% ����ѭ������
for i=1:length(t)
    pause (0.01);
    vector_position=[a*cos(t(i)) b*t(i) a*sin(t(i))];
    % �ɻ��ڵ�λ������
    airpln.translation=vector_position;
    % ��ת�Ƕ�����
    vector_velocity=[-a*sin(t(i)) b a*cos(t(i))];
    vector=cross(vector_velocity, vector_z);
    vector=vector/norm(vector);
    theta=acos(dot(vector_velocity, vector_z)/(norm(vector_velocity)*norm(vector_z)));
    % ��ת����
    airpln.rotation=[vector -theta];
    % ������ͼ
    vrdrawnow;
end

% �˳�����
pause;
close(world)
delete(world)


