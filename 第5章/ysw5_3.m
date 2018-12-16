clc,clear,close all
warning off
0.1+0.2-0.3
0.1-0.3+0.2

%%
clc,clear,close all
warning off
x_double=0.1;
x_ieee_01=double2ieee(x_double)

%%
clc,clear,close all
warning off
x_double_01_left=ieee2double('0011111110111001100110011001100110011001100110011001100110011001')
ans1 = double(x_double_01_left)-0.1 % 可以看出，第一个IEEE编码和0.1还是有差距的
x_double_01_right=ieee2double('0011111110111001100110011001100110011001100110011001100110011010')
ans2 = double(x_double_01_right)-0.1 % 第二个IEEE编码和0.1就没有区别了，但是第二个IEEE编码也不是0.1的真实编码，而是距离最近的一个，换句话说0.1是没有准确的IEEE编码的，当然还有很多数据也没有准确的IEEE编码

%%
% 0.2的编码转换 
clc,clear,close all
warning off
x_ieee_01=double2ieee(0.1) % 0.1 IEEE编码
x_double_01=ieee2double(x_ieee_01)
x_ieee_02=double2ieee(0.2) % 0.2 IEEE编码
x_double_02=ieee2double(x_ieee_02)
% 0.3的编码转换 
x_ieee_03=double2ieee(0.3) % 0.3 IEEE编码
x_double_03=ieee2double(x_ieee_03)

x_double_01-x_double_03+x_double_02










