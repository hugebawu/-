function [x_ieee,s,c,f]=double2ieee(x_double)
% ��˫��������ת��ΪIEEE����
% x_double=(-1)^s*2^(c-1023)*(1+f)��˫��������
% x_ieee��IEEE����
% s������λ������1
% c��ָ��λ������11
% f��β��λ������52

if x_double>0
    s='0';
else
    s='1';
end
n=floor(log2(x_double));
c=dec2bin(n+1023,11);
f=dec2bin(round((x_double/2^n-1)*2^52),52);
x_ieee=[s,c,f];