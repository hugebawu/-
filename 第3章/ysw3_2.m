clc,clear,close all
warning off
load('x.mat')
x=x';
y=[1:14];
x=mapminmax(x);
y=mapminmax(y);
net=newff(minmax(x),[80,1],{'tansig','purelin'},'traingdm');
% net=newff(minmax(x),[10,1],{'logsig','logsig'},'traingd');
% ��ǰ�����Ȩֵ����ֵ
inputWeights=net.IW{1,1};
inputbias=net.b{1};
% ��ǰ�����Ȩֵ����ֵ 
layerWeights=net.LW{2,1};
layerbias=net.b{2};
% ����ѵ������
net.trainParam.show = 50; 
net.trainParam.lr = 0.01; 
net.trainParam.mc = 0.9; 
net.trainParam.epochs = 400; 
net.trainParam.goal = 1e-3; 

% ���� TRAINGDM �㷨ѵ�� BP ����
[net, tr]=train(net, x, y); 
% �� BP ������з���
A_train = sim(net,x); 
% ����������
E = y - A_train; 
% �������
disp '����ѵ���������'
MSE = mse(E)  
figure(1)
plot(y,'ro--','linewidth',2)
hold on
plot(A_train,'bs--','linewidth',2)
legend('ʵ��ֵ','���ֵ')