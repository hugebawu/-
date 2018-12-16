clc,clear,close all
warning off
% »­Õý17±äÐÎ
cita = 0:2*pi/16:2*pi;
for i=1:17
    x(i)=30*cos(cita(i));
    y(i)=30*sin(cita(i));
end
plot(x,y,'r','linewidth',2)
hold on
cita1 = 0:0.01:2*pi;
for i=1:length(cita1)
    x1(i)=30*cos(cita1(i));
    y1(i)=30*sin(cita1(i));
end
plot(x1,y1,'b','linewidth',2)
grid on
