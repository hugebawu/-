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
ans1 = double(x_double_01_left)-0.1 % ���Կ�������һ��IEEE�����0.1�����в���
x_double_01_right=ieee2double('0011111110111001100110011001100110011001100110011001100110011010')
ans2 = double(x_double_01_right)-0.1 % �ڶ���IEEE�����0.1��û�������ˣ����ǵڶ���IEEE����Ҳ����0.1����ʵ���룬���Ǿ��������һ�������仰˵0.1��û��׼ȷ��IEEE����ģ���Ȼ���кܶ�����Ҳû��׼ȷ��IEEE����

%%
% 0.2�ı���ת�� 
clc,clear,close all
warning off
x_ieee_01=double2ieee(0.1) % 0.1 IEEE����
x_double_01=ieee2double(x_ieee_01)
x_ieee_02=double2ieee(0.2) % 0.2 IEEE����
x_double_02=ieee2double(x_ieee_02)
% 0.3�ı���ת�� 
x_ieee_03=double2ieee(0.3) % 0.3 IEEE����
x_double_03=ieee2double(x_ieee_03)

x_double_01-x_double_03+x_double_02










