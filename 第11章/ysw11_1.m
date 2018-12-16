clc,clear,close all
format rat;
A = [3 2 -1 4;   % 方程系数矩阵
    3/8 1 -1/8 1/4;
    1 -1 1/2 -1;
    1/2 -1 1/3 -1/6];
B1 = [-4,-1,7/2,2]';   % 方程右边b矩阵
x1 = gauss_x(A,B1)




