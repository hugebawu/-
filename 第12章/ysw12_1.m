clc,clear,close all
warning off
% 利用均匀分布产生随机数模拟
s = 1:365;
n=100;
pv=[];
for k=1:365
    success=0;
    for i=1:n % 对每一个s，实验n次
        y = floor(unifrnd(1,365,1,k)); % 产生1到365之间的均匀分布随机数k个
        % 检查是否有相同的
        minl = min(y); maxl = max(y);
        for j=minl:maxl
            ii = find(y==j);
            if(length(ii)>1)
                success = success +1;
                break;
            end
        end
    end
    % 计算概率
    pv(k)=success/n;
    % 理论概率
    gv =[];
end
for i=1:365
    gv(i)=1;
    for j=1:i
        gv(i)=gv(i)*(365-j+1)/365;
    end
    gv(i)=1-gv(i);
end
% 绘制图像
hold on
box on
grid on
plot(s,pv,'.')
plot(s,gv,'r-','Linewidth',1.5)
legend('频率','概率')
xlabel('生日问题模拟')
hold offclc,clear,close all
warning off
% 利用均匀分布产生随机数模拟
s = 1:365;
n=100;
pv=[];
for k=1:365
    success=0;
    for i=1:n % 对每一个s，实验n次
        y = floor(unifrnd(1,365,1,k)); % 产生1到365之间的均匀分布随机数k个
        % 检查是否有相同的
        minl = min(y); maxl = max(y);
        for j=minl:maxl
            ii = find(y==j);
            if(length(ii)>1)
                success = success +1;
                break;
            end
        end
    end
    % 计算概率
    pv(k)=success/n;
    % 理论概率
    gv =[];
end
for i=1:365
    gv(i)=1;
    for j=1:i
        gv(i)=gv(i)*(365-j+1)/365;
    end
    gv(i)=1-gv(i);
end
% 绘制图像
hold on
box on
grid on
plot(s,pv,'.')
plot(s,gv,'r-','Linewidth',1.5)
legend('频率','概率')
xlabel('生日问题模拟')
hold off




