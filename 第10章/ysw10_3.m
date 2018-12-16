% »æÖÆ×ãÇòÍøÂçÍØÆËÍ¼
clc,clear,close all
warning off
[a,v]=bucky;
H=sparse(60,60);
gplot(a-H,v,'r-');
hold on
gplot(H,v,'bo-')

