% 选取一个欧氏长度的直线段，将该线段三等分，去掉中间一段，剩下两段。
% 将剩下的两段分别再三等分，各去掉中间一段，剩下四段。
% 将这样的操作继续下去，直到无穷，则可得到一个离散的点集。
% 点数趋于无穷多，而欧氏长度趋于零。
% 经无限操作，达到极限时所得到的离散点集称之为Cantor集。
function f=cantor(ax,ay,bx,by)
c=0.2;d=2;
if (bx-ax)>c
    x=[ax,bx];y=[ay,by];hold on;
    plot(x,y,'LineWidth',5);hold off;
    cx=ax+(bx-ax)/3;
    cy=ay-d;
    dx=bx-(bx-ax)/3;
    dy=by-d;
    ay=ay-d;
    by=by-d;
    cantor(ax,ay,cx,cy);
    cantor(dx,dy,bx,by);
end