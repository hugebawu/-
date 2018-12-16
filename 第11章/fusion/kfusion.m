% -------------------------------------------------------------------------
% 图像融合实验。
%     比如显微镜或照相机在某一次固定焦距下清晰成像的物距是一定的，即成像的物体只有一个层面是清晰而其它层面是模糊的
% 需要我们把各幅在不同焦距下的图像融合成一张图像，使得远近的物体都清晰。
% 设定好融合图像数、小波分解的层数、彩色图像的通道数等几个参数后，可对原图像进行融合

% 本算法首先对彩色图像变成YIQ空间，对所有图像的各个颜色分量进行小波分解，然后在小波变换域上根据某种策略选取系数，最后做小波反变换和YIQ反变换即得结果图像
% -------------------------------------------------------------------------
clc,clear,close all
warning off
count=2;  % 融合图像数
level=2;  % 小波分解的层数
colors=3; % 彩色图像的通道数（黑白图像为1，彩色图像为3）
location = 'test/';
% 作颜色空间变换，变成亮度Y，色度I，饱和度Q
for i=1:count
    I_origin = im2double(imread([location num2str(i) '.jpg']));
    I_origin_yiq(i,:,:,:) = rgb2ntsc(I_origin);
    % subplot(2,count+1,i);
    figure;
    imshow(I_origin);
    title(['原图象' num2str(i)]);
end
% 对所有图像的各个颜色分量进行小波分解
for i=1:count 
    for d=1:colors
        I_cur(:,:)=I_origin_yiq(i,:,:,d);
        % 进行小波分解
        [C_cur,S]=wavedec2(I_cur,level,'db4');
        % 记录第i个图像的第d个颜色分量的分解系数
        C(i,d,:)=C_cur;
    end
end
% 分别在分解的各层处理系数
% 初始化为第一个图像的系数
Ca_len = S(1,1)*S(1,2);
C_len = length(C_cur);
C_fusion = zeros(3,C_len);
% 选择系数在3x3区域内方差比较大的
for l=1:level 
    % 该层的大小
    row = S(level+2-l,1);
    col = S(level+2-l,2);
    l_select = ones(row,col);  % 记录每一点选择的哪幅图片的系数,映射表
    l_ch_f = zeros(3,row,col);
    l_cv_f = zeros(3,row,col);
    l_cd_f = zeros(3,row,col);
    l_ch = zeros(count,3,row,col);  
    l_cv = zeros(count,3,row,col);            
    l_cd = zeros(count,3,row,col);            
    % 提取第一张图像的高频系数
    for d=1:colors 
        l_ch(1,d,:,:) = detcoef2('h',C(1,d,:),S,l);
        l_cv(1,d,:,:) = detcoef2('v',C(1,d,:),S,l);
        l_cd(1,d,:,:) = detcoef2('d',C(1,d,:),S,l);
    end  
    % 最后一层才提取低频系数
    if l==level
        l_ca_f = zeros(3,row,col);
        l_ca = zeros(count,3,row,col);
        for d=1:colors
            l_ca(1,d,:,:) = appcoef2(C(1,d,:),S,'db4',l);
        end
    end
  % 到当前图象为止细节分量的最大的方差和，只计算亮度的差别，初始化为第一副图像
  %  l_f_var = kvar(l_ch_f) + kvar(l_cv_f) + kvar(l_cd_f);
    l_f_var = kgrads(l_ch(1,1,:,:),'h') + kgrads(l_cv(1,1,:,:),'v');

    % 提取所有图像在第l层的高频系数，并计算方差，构造映射表
    for i=2:count
        for d=1:colors 
            l_ch(i,d,:,:) = detcoef2('h',C(i,d,:),S,l);
            l_cv(i,d,:,:) = detcoef2('v',C(i,d,:),S,l);
            l_cd(i,d,:,:) = detcoef2('d',C(i,d,:),S,l);
        end

        l_ch_var = kgrads(l_ch(i,1,:,:),'h');
        l_cv_var = kgrads(l_cv(i,1,:,:),'v');

        if l==level
            for d=1:colors
                l_ca(i,d,:,:) = appcoef2(C(i,d,:),S,'db4',l);
            end
        end

        % 在同一分辨率进行分组，使得各个朝向的选择是一样的。这里只选取了水平和垂直的两个方向
        for r=1:row
            for c=1:col
                if l_ch_var(r,c) + l_cv_var(r,c) > l_f_var(r,c)
                    l_select(r,c)=i;
                    l_f_var(r,c)=l_ch_var(r,c) + l_cv_var(r,c);
                end
            end
        end
    end
    % 一致性检验：如果某点周围的绝大部分是从i图像中获得的，则该点也从i图像获得
    l_select_con = kconsist(l_select);
    
    % 选取系数，由于是在小波变换域上选取系数，虽然只是用亮度来衡量，但也必须对色度和饱和度进行小波分解，选取系数
    for r=1:row
        for c=1:col
            for d=1:colors
                l_ch_f(d,r,c) = l_ch(l_select_con(r,c),d,r,c);
                l_cv_f(d,r,c) = l_cv(l_select_con(r,c),d,r,c);
                l_cd_f(d,r,c) = l_cd(l_select_con(r,c),d,r,c);
            end
        end
    end            
    if l==level
        for r=1:row
            for c=1:col
                for d=1:colors
                    l_ca_f(d,r,c) = l_ca(l_select_con(r,c),d,r,c);
                end
            end
        end
    end
    
    % 定位第l层系数在C中的起始位置
    S_prod = prod(S,2)*3;   
    beg = Ca_len + sum(S_prod(2:(level+1-l)));
    beg1 = beg+row*col;
    beg2 = beg1+row*col;

    % 保存第l层的融合系数
    for d=1:colors
        C_fusion(d,(beg+1):(beg+row*col)) = l_ch_f(d,:);
        C_fusion(d,(beg1+1):(beg1+row*col)) = l_cv_f(d,:);
        C_fusion(d,(beg2+1):(beg2+row*col)) = l_cd_f(d,:);
    end
end
for d=1:colors
    C_fusion(d,1:Ca_len) = l_ca_f(d,:);
end
% -------------------------------------------------------------------------
% 重构原信号
for d=1:colors
    I_result(:,:,d) = waverec2(C_fusion(d,:),S,'db4');
end

if colors==1 
    I_result(:,:,2) = I_origin_yiq(1,:,:,2);
    I_result(:,:,3) = I_origin_yiq(1,:,:,3);
end

I_result = ntsc2rgb(I_result);
imwrite(I_result,[location 'f' num2str(count) num2str(level) num2str(colors) '.jpg']);
imwrite(l_select_con/count,[location 'mgrads' num2str(count) num2str(level) 'con.jpg']);
figure;
imshow(I_result,[]);
title(['融合图象']);
