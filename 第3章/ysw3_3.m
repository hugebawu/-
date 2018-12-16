clear
close all;
ps=imread('ysw.jpg'); % ��ԭʼͼ��
figure(1)
imshow(ps)     % ��ʾԭʼͼ��
r = ps(:,:,1); % ��ɫ����
g = ps(:,:,2); % ��ɫ����
b = ps(:,:,3); % ��ɫ����
rgb = b-g/2-r/2;  % ȥ������
imshow(rgb)
bw = im2bw(rgb,0.2); % ��ֵ��
bw = ~bw;   % ȡ��
bw2 = bwareaopen(bw,30); % ȥ��С��
imshow(bw2)
%% �޳��������RGBͼ��
ps = rgb2gray(ps); % �ҶȻ�
ps = immultiply(ps,bw2); % ȥ������
figure(2)
imshow(ps);
for i=1:size(ps,1)
    for j=1:size(ps,2)
        if ps(i,j)>0
            ps(i,j)=ps(i,j)+20;
        end
    end
end
imshow(ps)
background=imopen(ps,strel('disk',4));
figure('color',[1,1,1])
surf(double(background(1:4:end,1:4:end))),zlim([0 256]);
set(gca,'Xdir','reverse');
set(gca,'Ydir','reverse');
box on
grid off
set(gca,'ZTick',zeros(1,0),'YTick',zeros(1,0),'XTick',zeros(1,0))