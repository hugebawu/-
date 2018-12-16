function ysw2_3
% ��ô��ȡGoogle��������
% open GR
ge_app = actxserver('GoogleEarth.ApplicationGE');   % GoogleEarth 6.0����
% �ȴ���װ
pause(7)
% �趨�ӽ�
camPos = ge_app.GetCamera(0);
% �ӽ�λ��
camPos.FocusPointLatitude           = 51.10719595658241;
camPos.FocusPointLongitude          = 13.638689585783112;
camPos.FocusPointAltitude           = 0.0;
camPos.FocusPointAltitudeMode       = 'AbsoluteAltitudeGE';
camPos.Range                        = 11780.53549488341;
camPos.Tilt                         = 0;
camPos.Azimuth                      = 7;  % 0 < Speed <5 --> Speed> 5: Teleport 
ge_app.SetCameraParams(camPos.FocusPointLatitude, camPos.FocusPointLongitude, camPos.FocusPointAltitude, camPos.FocusPointAltitudeMode, camPos.Range, camPos.Tilt, camPos.Azimuth, 6);

% measure x and y - distances
u_li   = ge_app.GetPointOnTerrainFromScreenCoords(-1,-1);    % ���·�
u_re   = ge_app.GetPointOnTerrainFromScreenCoords(1,-1);     % ���·�
o_li   = ge_app.GetPointOnTerrainFromScreenCoords(-1, 1);    % ���Ϸ�
dist_u = pos2dist(u_li.Latitude ,u_li.Longitude, u_re.Latitude , u_re.Longitude  ,1);   % distance x
dist_o = pos2dist(u_li.Latitude ,u_li.Longitude, o_li.Latitude , o_li.Longitude  ,1);   % distance y

% -1��1�ϲ������� 
[X,Y] = meshgrid(-1:(1/30):1, -1:(1/30):1);
Z     = NaN(size(X));    % �߶�����
% ��ȡ���� from GE
for i= 1: 1 : size (X,1)
    for j =1:1: size (X,2)
        pot = ge_app.GetPointOnTerrainFromScreenCoords(X(i,j), Y(i,j) );
        Z(i,j) = pot.Altitude;
    end;
end;

% ����ʵ�ʸ߶�
X_dist = (X + 1).*0.5.*dist_u;   % km
Y_dist = (Y + 1).*0.5.*dist_o;   % km
Z_dist = Z;                      % ����m


% ��ȡRGBͼ�� from GE
jmouseemu([600,500],'normal');      % �����ӽ�           
inputemu('key_alt','c');            % ����ͼ��        
pause(2);                           % �ȴ�       
[imdata] = clipboardimage('jpg');   % �õ�ͼ��  

% ת��Ϊ����ͼ��
[X2, map2] = rgb2ind(imdata, 256);  % uint8

% ���ƽ�ȡ����
figure('Color', [1 1 1 ]);
surface(X_dist,Y_dist,Z_dist,flipud(X2),'FaceColor','texturemap','EdgeColor','none', 'CDataMapping','direct')
colormap(map2);
xlim([0 dist_u]);
ylim([0 dist_o]);
view([-12,72]);
box on
grid on





























