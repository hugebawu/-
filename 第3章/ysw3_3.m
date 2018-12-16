clear
close all;
ps=imread('ysw.jpg'); % 读原始图像
figure(1)
imshow(ps)     % 显示原始图像
r = ps(:,:,1); % 红色分量
g = ps(:,:,2); % 绿色分量
b = ps(:,:,3); % 蓝色分量
rgb = b-g/2-r/2;  % 去除背景
imshow(rgb)
bw = im2bw(rgb,0.2); % 二值化
bw = ~bw;   % 取反
bw2 = bwareaopen(bw,30); % 去除小块
imshow(bw2)
%% 剔除背景后的RGB图像
ps = rgb2gray(ps); % 灰度化
ps = immultiply(ps,bw2); % 去掉背景
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