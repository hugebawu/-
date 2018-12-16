function ysw2_3
% 怎么读取Google地球数据
% open GR
ge_app = actxserver('GoogleEarth.ApplicationGE');   % GoogleEarth 6.0测试
% 等待安装
pause(7)
% 设定视角
camPos = ge_app.GetCamera(0);
% 视角位置
camPos.FocusPointLatitude           = 51.10719595658241;
camPos.FocusPointLongitude          = 13.638689585783112;
camPos.FocusPointAltitude           = 0.0;
camPos.FocusPointAltitudeMode       = 'AbsoluteAltitudeGE';
camPos.Range                        = 11780.53549488341;
camPos.Tilt                         = 0;
camPos.Azimuth                      = 7;  % 0 < Speed <5 --> Speed> 5: Teleport 
ge_app.SetCameraParams(camPos.FocusPointLatitude, camPos.FocusPointLongitude, camPos.FocusPointAltitude, camPos.FocusPointAltitudeMode, camPos.Range, camPos.Tilt, camPos.Azimuth, 6);

% measure x and y - distances
u_li   = ge_app.GetPointOnTerrainFromScreenCoords(-1,-1);    % 左下方
u_re   = ge_app.GetPointOnTerrainFromScreenCoords(1,-1);     % 右下方
o_li   = ge_app.GetPointOnTerrainFromScreenCoords(-1, 1);    % 左上方
dist_u = pos2dist(u_li.Latitude ,u_li.Longitude, u_re.Latitude , u_re.Longitude  ,1);   % distance x
dist_o = pos2dist(u_li.Latitude ,u_li.Longitude, o_li.Latitude , o_li.Longitude  ,1);   % distance y

% -1到1上产生网格 
[X,Y] = meshgrid(-1:(1/30):1, -1:(1/30):1);
Z     = NaN(size(X));    % 高度数据
% 获取海拔 from GE
for i= 1: 1 : size (X,1)
    for j =1:1: size (X,2)
        pot = ge_app.GetPointOnTerrainFromScreenCoords(X(i,j), Y(i,j) );
        Z(i,j) = pot.Altitude;
    end;
end;

% 计算实际高度
X_dist = (X + 1).*0.5.*dist_u;   % km
Y_dist = (Y + 1).*0.5.*dist_o;   % km
Z_dist = Z;                      % 海拔m


% 获取RGB图像 from GE
jmouseemu([600,500],'normal');      % 设置视角           
inputemu('key_alt','c');            % 复制图像        
pause(2);                           % 等待       
[imdata] = clipboardimage('jpg');   % 得到图像  

% 转换为索引图像
[X2, map2] = rgb2ind(imdata, 256);  % uint8

% 绘制截取曲面
figure('Color', [1 1 1 ]);
surface(X_dist,Y_dist,Z_dist,flipud(X2),'FaceColor','texturemap','EdgeColor','none', 'CDataMapping','direct')
colormap(map2);
xlim([0 dist_u]);
ylim([0 dist_o]);
view([-12,72]);
box on
grid on





























