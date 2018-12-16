clc,clear,close all
warning off
% 剩余定理
a = 1; % 被3除的余数
b = 2; % 被5除的余数
c = 3; % 被7除的余数
d = a * 70 + b*21+3*15;
while d>105
    d = d-105;
end
disp(['所求的数为：  ',num2str(d)])