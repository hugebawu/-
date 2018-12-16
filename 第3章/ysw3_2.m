clc,clear,close all
warning off
load('x.mat')
x=x';
y=[1:14];
x=mapminmax(x);
y=mapminmax(y);
net=newff(minmax(x),[80,1],{'tansig','purelin'},'traingdm');
% net=newff(minmax(x),[10,1],{'logsig','logsig'},'traingd');
% 当前输入层权值和阈值
inputWeights=net.IW{1,1};
inputbias=net.b{1};
% 当前网络层权值和阈值 
layerWeights=net.LW{2,1};
layerbias=net.b{2};
% 设置训练参数
net.trainParam.show = 50; 
net.trainParam.lr = 0.01; 
net.trainParam.mc = 0.9; 
net.trainParam.epochs = 400; 
net.trainParam.goal = 1e-3; 

% 调用 TRAINGDM 算法训练 BP 网络
[net, tr]=train(net, x, y); 
% 对 BP 网络进行仿真
A_train = sim(net,x); 
% 计算仿真误差
E = y - A_train; 
% 均方误差
disp '网络训练均方误差'
MSE = mse(E)  
figure(1)
plot(y,'ro--','linewidth',2)
hold on
plot(A_train,'bs--','linewidth',2)
legend('实际值','输出值')