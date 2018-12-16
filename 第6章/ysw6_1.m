clc,clear,close all
warning off
num = 67;
for i=1:35
    if 2*floor(num/2)<num  % ÆæÊý
        num = num*3+1;
    else
        num = num /2;
    end
    a(i)=num;
end
a
%%