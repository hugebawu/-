function [x_ieee,s,c,f]=double2ieee(x_double)
% 将双精度数据转换为IEEE编码
% x_double=(-1)^s*2^(c-1023)*(1+f)，双精度数据
% x_ieee，IEEE编码
% s，符号位，长度1
% c，指数位，长度11
% f，尾数位，长度52

if x_double>0
    s='0';
else
    s='1';
end
n=floor(log2(x_double));
c=dec2bin(n+1023,11);
f=dec2bin(round((x_double/2^n-1)*2^52),52);
x_ieee=[s,c,f];