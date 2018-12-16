%  创建一个COM server，驱动Google Earth
handle = actxserver ('googleearth.ApplicationGE');
%设定视角位置
lat = 37.77742;
long = -122.4202;
alt = 10000;
altMode = 2;
range = 0;
tilt = 0;
heading = 0;
speed = 1;

%设置Google Earth视角参数
handle.SetCameraParams(lat,long,alt,altMode,range,tilt,heading,speed);
%获取视角中心目标点
my_target = handle.GetPointOnTerrainFromScreenCoords(0,0);

pause(5)
%设置聚焦点
new_target = handle.GetCamera(0);
set(new_target, 'FocusPointLatitude', 37.8262);
set(new_target, 'FocusPointLongitude', -122.4996);
set(new_target, 'FocusPointAltitude', 235);
set(new_target, 'FocusPointAltitudeMode', 2);
set(new_target, 'Range', 0);
set(new_target, 'Tilt', 75);
set(new_target, 'Azimuth', 105);
handle.SetCamera(new_target,1);
