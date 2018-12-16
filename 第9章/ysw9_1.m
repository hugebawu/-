function ysw9_1
clc,clear,close all
warning off
flag_size = [600 400];   % 窗口大小
flag_dimension_in_pixel = flag_size; %[600 400]; 
figure_leftbottom_pos = [100 100]; 
bkg_color = [1 0 0]; 
star_color = [1 1 0]; 
flag_horiz_units_num = 30; 
flag_verti_units_num = 20; 
star_vertices_x = zeros(10, 5); 
star_vertices_y = zeros(10, 5); 
stars(5).center_pos = []; 
stars(1).center_pos = [5 15]; 
stars(1).radius = 3; 
stars(1).orientation = 0;  
stars(2).center_pos = [10 18]; 
stars(2).radius = 1; 
stars(2).orientation = 0;  
stars(3).center_pos = [12 16]; 
stars(3).radius = 1; 
stars(3).orientation = 0;  
stars(4).center_pos = [12 13]; 
stars(4).radius = 1; 
stars(4).orientation = 0;  
stars(5).center_pos = [10 11]; 
stars(5).radius = 1; 
stars(5).orientation = 0; 
for i = 2:5 
    dists = deal(stars(i).center_pos - stars(1).center_pos); 
    stars(i).orientation = atan(dists(2)/dists(1)).*180/pi + 90; 
end 
%% 绘制红色背景
flag_figure = figure('Units', 'pixels', ... 
    'Position', [figure_leftbottom_pos, flag_dimension_in_pixel]); 
flag_axes = axes('Parent', flag_figure, 'Units','pixels', ... 
    'Position', [1 1 flag_dimension_in_pixel], 'Color', [1 0 0]); 
set(flag_axes, 'XLim', [0 flag_horiz_units_num], 'YLim', [0 flag_verti_units_num]); 
rectangle('Position', [0 0 flag_horiz_units_num flag_verti_units_num], ... 
            'FaceColor', bkg_color ,'EdgeColor' ,bkg_color);          
set(flag_axes, 'Visible','off'); 

%% 绘制无个红星 
for i = 1:5 
    [star_vertices_x(:, i) star_vertices_y(:, i)] = ... 
    GetPentagramVertices(stars(i).center_pos, ... 
     stars(i).radius,stars(i).orientation);                               
end 
star_handles = patch(star_vertices_x, star_vertices_y, star_color); 
set(star_handles, 'EdgeColor', star_color); 
flag_texture = double(frame2im(getframe(flag_figure)))./255; 

imwrite(flag_texture, 'FiveStarRedFlag.png');  % 写为一幅图像

end

function [x y] = GetPentagramVertices(centerPos, radius, orientation) 
% 子函数： 获得五角星的十个顶点 
Rad_ext = radius .* ones(1,5); 
Ori_ext = ([0:72:359] + 90 +orientation).* pi/ 180; 

Rad_int = radius .* sind(18)./sind(126) .* ones(1,5); 
Ori_int = ([0:72:359] - 90 +orientation).* pi/ 180; 
Ori_int = Ori_int([4 5 1 2 3]); 

Rad_all = zeros(1,10); 
Ori_all = zeros(1,10); 

Rad_all([1:2:10 2:2:10]) = [Rad_ext Rad_int]; 
Ori_all([1:2:10 2:2:10]) = [Ori_ext Ori_int]; 

[x y] = pol2cart(Ori_all, Rad_all); 

x = x + centerPos(1); 
y = y + centerPos(2); 
end



