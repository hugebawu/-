clc,clear,close all
warning off
cita = 0:0.1:pi/2;  % 抛掷铅球角度 (弧度)
g = 9.8;  % 重力加速度  (m/s/s)
v = 4;    % 一个人投掷铅球最大出手速度 (m/s)
h = 1.8;  % 一个人的高度（m）
cita_f = acos(g*h/(g*h+v^2))/2;
cita1 = 5*pi/180;  % 角度1
cita2 = 15*pi/180;  % 角度2
cita3 = 45*pi/180;  % 角度3
cita4 = 65*pi/180;  % 角度4
cita5 = 80*pi/180;  % 角度5
tt=0:0.01:1.5;
for i=1:length(tt)
    t = tt(i);
    if t<v*sin(cita_f)/g
        Hf(i) =  h+g*t^2/2;
    else
        Hf(i) = -g/2*(t-v*sin(cita_f)/g).^2 + h + v^2*sin(cita_f)^2/2/g;
    end
    tf(i) = v*cos(cita_f)*t;
    % 5度
    if t<v*sin(cita1)/g
        H1(i) =  h + g*t^2/2;
    else   
        H1(i) = -g/2*(t-v*sin(cita1)/g).^2 + h + v^2*sin(cita1)^2/2/g;
    end
    t1(i) = v*cos(cita1)*t;
    % 15度
    if t<v*sin(cita2)/g
        H2(i) =  h + g*t^2/2;
    else   
        H2(i) = -g/2*(t-v*sin(cita2)/g).^2 + h + v^2*sin(cita2)^2/2/g;
    end   
    t2(i) = v*cos(cita2)*t;
    % 35度
    if t<v*sin(cita3)/g
        H3(i) =  h + g*t^2/2;
    else   
        H3(i) = -g/2*(t-v*sin(cita3)/g).^2 + h + v^2*sin(cita3)^2/2/g;
    end      
    t3(i) = v*cos(cita3)*t;   
    % 65度
    if t<v*sin(cita4)/g
        H4(i) =  h + g*t^2/2;
    else   
        H4(i) = -g/2*(t-v*sin(cita4)/g).^2 + h + v^2*sin(cita4)^2/2/g;
    end   
    t4(i) = v*cos(cita4)*t; 
    % 80度   
    if t<v*sin(cita5)/g
        H5(i) =  h + g*t^2/2;
    else   
        H5(i) = -g/2*(t-v*sin(cita5)/g).^2 + h + v^2*sin(cita5)^2/2/g;
    end   
   t5(i) = v*cos(cita5)*t; 
end

plot(tf,Hf,'r','linewidth',2)
hold on
plot(t1,H1,'b','linewidth',2)
plot(t2,H2,'g','linewidth',2)
plot(t3,H3,'g','linewidth',2)
plot(t4,H4,'m','linewidth',2)
plot(t5,H5,'k','linewidth',2)
legend('z最优角','5度','15度','45度','65度','80度')
xlabel('水平位移');ylabel('垂直高度')
grid on
axis([0,3,0,4])
