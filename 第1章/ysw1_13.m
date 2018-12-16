%
clc,clear,close all
warning off
mu = 0:0.01:12;
y = gampdf(2,3,mu);
plot(mu,y)
