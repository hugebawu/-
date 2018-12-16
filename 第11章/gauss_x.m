function x = gauss_x(A,B)
% A为函数系数矩阵；
% B为函数值矩阵；
%x为求得未知量值；
format rat
C = [A,B];
nc = size(C); %求C的行列数
for j = 1 : nc(1,2)-2  % 列数
    for i = j+1 : nc(1,1)    % 行数
        C(i,:) = -C(j,j)./C(i,j) .*C(i,:) + C(j,:); % 每行元素进行消元法
    end
end
switch nc(1,1)
    case 1  % 1个未知数求解，1阶方程
        x(1) = C(1,end)/C(1,end-1);
    case 2  % 2个未知数求解，2阶方程   
        x(2) = C(2,end)/C(2,end-1);
        x(1) = ( C(1,end)-C(1,end-1)*x(2) )/ C(1,end-2);
        x=[x(1);x(2)];
    case 3  % 3个未知数求解，3阶方程
        x(3) = C(3,end)/C(3,end-1);
        x(2) = ( C(2,end)-C(2,end-1)*x(3) )/ C(2,end-2);
        x(1) = ( C(1,end)-C(1,end-1)*x(3)- C(1,end-2)*x(2))/ C(1,end-3);  
        x=[x(1);x(2);x(3)];
    case 4  % 4个未知数求解，4阶方程
        x(4) = C(4,end)/C(4,end-1);
        x(3) = ( C(3,end)-C(3,end-1)*x(4) )/ C(3,end-2);
        x(2) = ( C(2,end)-C(2,end-1)*x(4)- C(2,end-2)*x(3))/ C(2,end-3);         
        x(1) = ( C(1,end)-C(1,end-1)*x(4)- C(1,end-2)*x(3)-C(1,end-3)*x(2))/ C(1,end-4);  
        x=[x(1);x(2);x(3);x(4)];
    case 5  % 5个未知数求解，5阶方程
        x(5) = C(5,end)/C(5,end-1);
        x(4) = ( C(4,end)-C(4,end-1)*x(5) )/ C(4,end-2);
        x(3) = ( C(3,end)-C(3,end-1)*x(5)- C(3,end-2)*x(4))/ C(3,end-3);         
        x(2) = ( C(2,end)-C(2,end-1)*x(5)- C(2,end-2)*x(4)-C(2,end-3)*x(3))/ C(2,end-4);  
        x(1) = ( C(1,end)-C(1,end-1)*x(5)- C(1,end-2)*x(4)-C(1,end-3)*x(3)-C(1,end-4)*x(2))/ C(1,end-5); 
        x=[x(1);x(2);x(3);x(4);x(5)];    
end
end
