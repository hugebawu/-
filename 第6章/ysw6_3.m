function ysw6_3

    clc,clear,close all
    warning off
    a=17;             % 输入一个数字
    b = num2str(a);   % 字符格式
    c = swap(b);      % 方向取反  1234 --> 4321
    d = str2num(c);   % 数字格式
    if a==d
        return;
    else
        d = 0;
        d1 = 1;   % 字符格式
        d2 = 2;      % 方向取反  1234 --> 4321
        d3 = 3;   % 数字格式
        while d~=d3
            d = d+a;
            d1 = num2str(d);   % 字符格式
            d2 = swap(d1);      % 方向取反  1234 --> 4321
            d3 = str2num(d2);   % 数字格式 
            a = d3;
        end
        disp(['回文数：  ',num2str(d3)])
    end
    
end

function MA=swap(ma)
ma1=ma;
Nma=size(ma,2);
maij=(Nma(1,1):-1:1)';
[ma(1,:),ma(maij)] = deal(ma(1,maij),ma(1,:));
MA=ma;
ma=ma1;
end




