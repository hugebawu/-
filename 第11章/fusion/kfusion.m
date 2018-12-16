% -------------------------------------------------------------------------
% ͼ���ں�ʵ�顣
%     ������΢�����������ĳһ�ι̶���������������������һ���ģ������������ֻ��һ������������������������ģ����
% ��Ҫ���ǰѸ����ڲ�ͬ�����µ�ͼ���ںϳ�һ��ͼ��ʹ��Զ�������嶼������
% �趨���ں�ͼ������С���ֽ�Ĳ�������ɫͼ���ͨ�����ȼ��������󣬿ɶ�ԭͼ������ں�

% ���㷨���ȶԲ�ɫͼ����YIQ�ռ䣬������ͼ��ĸ�����ɫ��������С���ֽ⣬Ȼ����С���任���ϸ���ĳ�ֲ���ѡȡϵ���������С�����任��YIQ���任���ý��ͼ��
% -------------------------------------------------------------------------
clc,clear,close all
warning off
count=2;  % �ں�ͼ����
level=2;  % С���ֽ�Ĳ���
colors=3; % ��ɫͼ���ͨ�������ڰ�ͼ��Ϊ1����ɫͼ��Ϊ3��
location = 'test/';
% ����ɫ�ռ�任���������Y��ɫ��I�����Ͷ�Q
for i=1:count
    I_origin = im2double(imread([location num2str(i) '.jpg']));
    I_origin_yiq(i,:,:,:) = rgb2ntsc(I_origin);
    % subplot(2,count+1,i);
    figure;
    imshow(I_origin);
    title(['ԭͼ��' num2str(i)]);
end
% ������ͼ��ĸ�����ɫ��������С���ֽ�
for i=1:count 
    for d=1:colors
        I_cur(:,:)=I_origin_yiq(i,:,:,d);
        % ����С���ֽ�
        [C_cur,S]=wavedec2(I_cur,level,'db4');
        % ��¼��i��ͼ��ĵ�d����ɫ�����ķֽ�ϵ��
        C(i,d,:)=C_cur;
    end
end
% �ֱ��ڷֽ�ĸ��㴦��ϵ��
% ��ʼ��Ϊ��һ��ͼ���ϵ��
Ca_len = S(1,1)*S(1,2);
C_len = length(C_cur);
C_fusion = zeros(3,C_len);
% ѡ��ϵ����3x3�����ڷ���Ƚϴ��
for l=1:level 
    % �ò�Ĵ�С
    row = S(level+2-l,1);
    col = S(level+2-l,2);
    l_select = ones(row,col);  % ��¼ÿһ��ѡ����ķ�ͼƬ��ϵ��,ӳ���
    l_ch_f = zeros(3,row,col);
    l_cv_f = zeros(3,row,col);
    l_cd_f = zeros(3,row,col);
    l_ch = zeros(count,3,row,col);  
    l_cv = zeros(count,3,row,col);            
    l_cd = zeros(count,3,row,col);            
    % ��ȡ��һ��ͼ��ĸ�Ƶϵ��
    for d=1:colors 
        l_ch(1,d,:,:) = detcoef2('h',C(1,d,:),S,l);
        l_cv(1,d,:,:) = detcoef2('v',C(1,d,:),S,l);
        l_cd(1,d,:,:) = detcoef2('d',C(1,d,:),S,l);
    end  
    % ���һ�����ȡ��Ƶϵ��
    if l==level
        l_ca_f = zeros(3,row,col);
        l_ca = zeros(count,3,row,col);
        for d=1:colors
            l_ca(1,d,:,:) = appcoef2(C(1,d,:),S,'db4',l);
        end
    end
  % ����ǰͼ��Ϊֹϸ�ڷ��������ķ���ͣ�ֻ�������ȵĲ�𣬳�ʼ��Ϊ��һ��ͼ��
  %  l_f_var = kvar(l_ch_f) + kvar(l_cv_f) + kvar(l_cd_f);
    l_f_var = kgrads(l_ch(1,1,:,:),'h') + kgrads(l_cv(1,1,:,:),'v');

    % ��ȡ����ͼ���ڵ�l��ĸ�Ƶϵ���������㷽�����ӳ���
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

        % ��ͬһ�ֱ��ʽ��з��飬ʹ�ø��������ѡ����һ���ġ�����ֻѡȡ��ˮƽ�ʹ�ֱ����������
        for r=1:row
            for c=1:col
                if l_ch_var(r,c) + l_cv_var(r,c) > l_f_var(r,c)
                    l_select(r,c)=i;
                    l_f_var(r,c)=l_ch_var(r,c) + l_cv_var(r,c);
                end
            end
        end
    end
    % һ���Լ��飺���ĳ����Χ�ľ��󲿷��Ǵ�iͼ���л�õģ���õ�Ҳ��iͼ����
    l_select_con = kconsist(l_select);
    
    % ѡȡϵ������������С���任����ѡȡϵ������Ȼֻ������������������Ҳ�����ɫ�Ⱥͱ��ͶȽ���С���ֽ⣬ѡȡϵ��
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
    
    % ��λ��l��ϵ����C�е���ʼλ��
    S_prod = prod(S,2)*3;   
    beg = Ca_len + sum(S_prod(2:(level+1-l)));
    beg1 = beg+row*col;
    beg2 = beg1+row*col;

    % �����l����ں�ϵ��
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
% �ع�ԭ�ź�
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
title(['�ں�ͼ��']);
