clc,clear,close all
warning off
im = imread('hubei.bmp');
figure(1),imshow(im)
% ���е�����
x1 = 312; y1 = 95;  % ʮ��
x2 = 474; y2 = 181; % �差��
x3 = 144; y3 = 499; % ��ʩ����������������
x4 = 385; y4 = 387; % �˲���
x5 = 488; y5 = 342; % ������
x6 = 503; y6 = 444; % ������
x7 = 639; y7 = 224; % ������
x8 = 713; y8 = 343; % Т����
x9 = 760; y9 = 395; % �人��
x10 = 840; y10 = 406; % �Ƹ���
x11 = 828; y11 = 418; % ������
x12 = 862; y12 = 449; % ��ʯ��
x13 = 769; y13 = 508; % ������
xy = [x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13;
    y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13]';  % ���е�λ������
n = 13;%���е�����
hold on
plot(xy(:,1),xy(:,2),'r.','Markersize',20)

%%
popSize = 60;  % ��Ⱥ�Ĵ�С��һ�㱻4����
numIter = 1e4; % �㷨�����Ĵ���
showProg = 1;  % �������������ִ���Ŵ��㷨�Ĳ���
showResult = 1;% �������������ִ���Ŵ��㷨�Ľ��
a = meshgrid(1:n);
dmat = reshape(sqrt(sum((xy(a,:)-xy(a',:)).^2,2)),n,n);%����֮��ľ���/�ɱ�
[optRoute,minDist] = tsp_ga(xy,dmat,popSize,numIter,showProg,showResult);
%% Output:
% optRoute �Ŵ��㷨�ó�������·��
% minDist ����·���µĳɱ�ֵ�����ֵ
%%
figure,
imshow(im);
for i=1:n
    hold on
    plot(xy(:,1),xy(:,2),'r.','Markersize',20);
    text(xy(i,1),xy(i,2)+0.08,num2str(i));
end
for i=1:n-1
    plot([xy(optRoute(1,i),1),xy(optRoute(1,i+1),1)],[xy(optRoute(1,i),2),xy(optRoute(1,i+1),2)],'r-','linewidth',2)
    hold on
end
for i=n
    plot([xy(optRoute(1,i),1),xy(optRoute(1,1),1)],[xy(optRoute(1,i),2),xy(optRoute(1,1),2)],'r-','linewidth',2)
    hold on
end





