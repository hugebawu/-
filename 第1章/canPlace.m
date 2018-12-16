%子函数，判断能否放在位置（x,y）
function p=canPlace(x,y)
global Indexes;
%判断是否会攻击已放置的皇后（位于同一对角线或同一行列上）
for a=1:x-1%a为行号
    b=Indexes(a);%b为已放置皇后所在列号
    %         if (x-y==a-b || x+y==a+b || x==a || y==b)%判断是否位于同一对角线和同一行列上
    if (x-y==a-b || x+y==a+b || y==b)%判断是否位于同一对角线和同一列上，^_^
        p=0;
        return;%退出子函数
    end
end
p=1;
end