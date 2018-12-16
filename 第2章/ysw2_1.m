% 清楚变量
clc,clear all,close all;

% 参数设置
n=4;
t=0:0.02:n*pi;
a=8;
b=1;

% 3D虚拟现实
world=vrworld('my_plane.wrl', 'new');
open(world);
fig=vrfigure(world);
set(fig, 'Viewpoint', 'Far View');
airpln=vrnode(world, 'Plane');
vector_z=[0 0 1];

% 仿真循环操作
for i=1:length(t)
    pause (0.01);
    vector_position=[a*cos(t(i)) b*t(i) a*sin(t(i))];
    % 飞机节点位置设置
    airpln.translation=vector_position;
    % 旋转角度设置
    vector_velocity=[-a*sin(t(i)) b a*cos(t(i))];
    vector=cross(vector_velocity, vector_z);
    vector=vector/norm(vector);
    theta=acos(dot(vector_velocity, vector_z)/(norm(vector_velocity)*norm(vector_z)));
    % 旋转设置
    airpln.rotation=[vector -theta];
    % 更新视图
    vrdrawnow;
end

% 退出设置
pause;
close(world)
delete(world)


