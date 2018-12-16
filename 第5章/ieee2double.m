function [x_double,s,c,f]=ieee2double(x_ieee)
% 将IEEE编码转换为双精度数据
% x_double=(-1)^s*2^(c-1023)*(1+f)，双精度数据
% x_ieee，IEEE编码
% s，符号位，长度1
% c，指数位，长度11
% f，尾数位，长度52
%
s=bin2dec(x_ieee(1));
c=bin2dec(x_ieee(2:12));
m=bin2dec(x_ieee(13:64)');
% 为了保证精度，使用符号运算
f=sym('1/2').^(1:52)*m;
x_double=(-1)^s*2^(c-1023)*(1+f);