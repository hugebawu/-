function [x_double,s,c,f]=ieee2double(x_ieee)
% ��IEEE����ת��Ϊ˫��������
% x_double=(-1)^s*2^(c-1023)*(1+f)��˫��������
% x_ieee��IEEE����
% s������λ������1
% c��ָ��λ������11
% f��β��λ������52
%
s=bin2dec(x_ieee(1));
c=bin2dec(x_ieee(2:12));
m=bin2dec(x_ieee(13:64)');
% Ϊ�˱�֤���ȣ�ʹ�÷�������
f=sym('1/2').^(1:52)*m;
x_double=(-1)^s*2^(c-1023)*(1+f);