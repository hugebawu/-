function ysw6_3

    clc,clear,close all
    warning off
    a=17;             % ����һ������
    b = num2str(a);   % �ַ���ʽ
    c = swap(b);      % ����ȡ��  1234 --> 4321
    d = str2num(c);   % ���ָ�ʽ
    if a==d
        return;
    else
        d = 0;
        d1 = 1;   % �ַ���ʽ
        d2 = 2;      % ����ȡ��  1234 --> 4321
        d3 = 3;   % ���ָ�ʽ
        while d~=d3
            d = d+a;
            d1 = num2str(d);   % �ַ���ʽ
            d2 = swap(d1);      % ����ȡ��  1234 --> 4321
            d3 = str2num(d2);   % ���ָ�ʽ 
            a = d3;
        end
        disp(['��������  ',num2str(d3)])
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




