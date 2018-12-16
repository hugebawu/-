function Q= Queens(n)
global Indexes;
A=ones(n,n);%初始化棋盘
Indexes=zeros(1,n);%记录皇后的位置坐标
i=1;%行号
j=1;%列号
count=0;%统计解的个数
while (i>0)
    while j<=n
        if canPlace(i,j)%找不会攻击其他皇后的位置
            A(i,j)=8;%8代表皇后
            Indexes(i)=j;
            break;%跳出本循环
        else
            j=j+1;%探查下一个位置
        end
    end
   
    if j<=n%如果找到合适的位置，则找下一个
        i=i+1;
        j=1;
    else%如果找不到合适的位置，则回溯，退回到上一行
        i=i-1;
        if i~=0
            j=Indexes(i);
            A(i,j)=1;%还原值
            Indexes(i)=0;%去掉保留的坐标
            j=j+1;%从上一个皇后的后面一个位置开始找
        end
    end
   
    if (Indexes(n)~=0)%如果找到一个解
        count=count+1;
        disp(A);%输出矩阵
    end
end
disp([num2str(n),'皇后问题解的个数为:',num2str(count)]);%输出解的个数
end


