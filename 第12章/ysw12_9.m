clc,clear,close all
warning off
% Galton��������
% ���ò���
m = 500;
n=5;
p=0.5;
rand('seed',3);
R=binornd(n,p,1,m);  % ģ����Ӷ���ֲ�����������൱��ģ��Ͷ��m��
% ȷ�����ڱ��Ϊi-1�ĸ��ӵ�С��Ƶ��
for i=1:n+1
    k=[];
    k = find(R==(i-1));
    h(i)=length(k)/m;
end
x=0:n;
figure('color',[1,1,1])
subplot(121)
% ��Ƶ��ͼ
axis([-1,6,0,1])
bar(x,h)
xlabel('(1)500��Ͷ��С��ѻ���Ƶ��ͼ')
f = binopdf(x,n,p);
subplot(122)
axis([-1,6,0,1])
bar(x,f)
xlabel('(2)���۷ֲ�B(5,0.5)�ķֲ�ͼ')








