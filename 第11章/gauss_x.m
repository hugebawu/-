function x = gauss_x(A,B)
% AΪ����ϵ������
% BΪ����ֵ����
%xΪ���δ֪��ֵ��
format rat
C = [A,B];
nc = size(C); %��C��������
for j = 1 : nc(1,2)-2  % ����
    for i = j+1 : nc(1,1)    % ����
        C(i,:) = -C(j,j)./C(i,j) .*C(i,:) + C(j,:); % ÿ��Ԫ�ؽ�����Ԫ��
    end
end
switch nc(1,1)
    case 1  % 1��δ֪����⣬1�׷���
        x(1) = C(1,end)/C(1,end-1);
    case 2  % 2��δ֪����⣬2�׷���   
        x(2) = C(2,end)/C(2,end-1);
        x(1) = ( C(1,end)-C(1,end-1)*x(2) )/ C(1,end-2);
        x=[x(1);x(2)];
    case 3  % 3��δ֪����⣬3�׷���
        x(3) = C(3,end)/C(3,end-1);
        x(2) = ( C(2,end)-C(2,end-1)*x(3) )/ C(2,end-2);
        x(1) = ( C(1,end)-C(1,end-1)*x(3)- C(1,end-2)*x(2))/ C(1,end-3);  
        x=[x(1);x(2);x(3)];
    case 4  % 4��δ֪����⣬4�׷���
        x(4) = C(4,end)/C(4,end-1);
        x(3) = ( C(3,end)-C(3,end-1)*x(4) )/ C(3,end-2);
        x(2) = ( C(2,end)-C(2,end-1)*x(4)- C(2,end-2)*x(3))/ C(2,end-3);         
        x(1) = ( C(1,end)-C(1,end-1)*x(4)- C(1,end-2)*x(3)-C(1,end-3)*x(2))/ C(1,end-4);  
        x=[x(1);x(2);x(3);x(4)];
    case 5  % 5��δ֪����⣬5�׷���
        x(5) = C(5,end)/C(5,end-1);
        x(4) = ( C(4,end)-C(4,end-1)*x(5) )/ C(4,end-2);
        x(3) = ( C(3,end)-C(3,end-1)*x(5)- C(3,end-2)*x(4))/ C(3,end-3);         
        x(2) = ( C(2,end)-C(2,end-1)*x(5)- C(2,end-2)*x(4)-C(2,end-3)*x(3))/ C(2,end-4);  
        x(1) = ( C(1,end)-C(1,end-1)*x(5)- C(1,end-2)*x(4)-C(1,end-3)*x(3)-C(1,end-4)*x(2))/ C(1,end-5); 
        x=[x(1);x(2);x(3);x(4);x(5)];    
end
end
