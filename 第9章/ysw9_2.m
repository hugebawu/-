clc,clear,close all
warning off
flag_size = [400 600];   % 窗口大小
flag_texture = imread('FiveStarRedFlag.png');  % 加载图像
flag_texture = double(flag_texture);  % 双精度
%% Constants
cycle = 2;
cycle2 = 3;
frames = 10;
wave_length = flag_size(1)./cycle;
wave_length2 = flag_size(2)./cycle2;
rot_angle = 15.*pi/180;
rot_angle2 = 5.*pi/180;
amp1 = 1;
amp2 = 0.5;
%% Main Program
flag_figure_handle = gcf;
[flag_x flag_y] = meshgrid(1:flag_size(2), 1:flag_size(1));
for i = 1:frames  
    cla;
    flag_z = amp1.*sin((cos(rot_angle).*flag_x - sin(rot_angle).*flag_y).*2*pi./wave_length ... 
               - 2*pi*(i-1)/frames) + ...
              amp2.*sin((cos(rot_angle2).*flag_x-sin(rot_angle2).*flag_y).*2*pi./wave_length2 ...
               - 2*pi*(i-1)/frames) + ...        
               sin((cosd(20).*flag_x-sind(20).*flag_y).*2*pi./600 - 2*pi*(i-1)/frames); 
end
figure('color',[1,1,1])
flag_surf_handle = warp(flag_x,flag_y,flag_z,flag_texture);
view(2);
set(flag_surf_handle, 'FaceLighting', 'phong','AmbientStrength', 0.7);
set(gca, 'Visible', 'off', 'XLim', [1 600], 'YLim', [1 400], 'ZLim', [-3 3]);
camproj('perspective')
% material dull

