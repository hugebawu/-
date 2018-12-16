clc,clear,close all
warning off
% Galton钉板试验
% 设置参数
m = 500;
n=5;
p=0.5;
rand('seed',3);
R=binornd(n,p,1,m);  % 模拟服从二项分布的随机数，相当于模拟投球m次
% 确定落在编号为i-1的格子的小球频率
for i=1:n+1
    k=[];
    k = find(R==(i-1));
    h(i)=length(k)/m;
end
x=0:n;
figure('color',[1,1,1])
subplot(121)
% 画频率图
axis([-1,6,0,1])
bar(x,h)
xlabel('(1)500次投球小球堆积的频率图')
f = binopdf(x,n,p);
subplot(122)
axis([-1,6,0,1])
bar(x,f)
xlabel('(2)理论分布B(5,0.5)的分布图')








