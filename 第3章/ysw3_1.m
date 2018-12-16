clc,clear,close all
warning off
tic
load('GDP.mat')
fj = GDP(:,1);   % 平均房价：元/平米
GDP = GDP(:,2);  % 人均GDP：元
GDP2 = 0:1000:2.43*max(GDP);
b = polyfit(GDP,fj,2)
fjy = b(1)*GDP2.^2+b(2)*GDP2+b(3);
figure(1),
plot(GDP,fj,'o-','linewidth',2)
figure(2),
plot(GDP,fj,'o-','linewidth',2)
hold on
plot(GDP2,fjy,'r-','linewidth',2)
toc


