% ������������Ա���ʷ���
clc,clear,close all
warning off
% ��ֱ�������в�ȣ���ֱ�Ƕȣ�
y=zeros(71,51);  
for i=0:70
    for j=0:50
        if ( j == 0 & i >= 32 & i <=38 ) 
            y(i+1,j+1)=90;
        elseif ( j == 0 & (i < 32 | i > 38 ))
            y(i+1,j+1)=0;
        else 
            y(i+1,j+1)=(atan(2.44/sqrt((i-35)^2+j^2))/(2*pi))*360;
        end
    end
end
y;
% ˮƽ�������в�ȣ�ˮƽ�Ƕȣ�
x=zeros(71,51);  
for i=0:70
    for j=0:50
        if ( j == 0 & i >= 32 & i <=38 ) 
            x(i+1,j+1)=180;
        elseif ( j == 0 & (i < 32 | i > 38 ))
            x(i+1,j+1)=0;
        else 
            x(i+1,j+1)=((atan((i-35+3.66)/j)-atan((i-35-3.66)/j))/(2*pi))*360;
        end
    end
 end
x;
% ����Ա�˵���ĸ���
p=zeros(71,51);
for i=1:71
    for j=1:51
        x(i,j)=x(i,j)^2/1600;
        y(i,j)=y(i,j)^2/400;
        if (sqrt((i-1-35)^2+(j-1)^2)/10-1/7>0)
            p(i,j)=exp(-(x(i,j)+y(i,j))/(sqrt((i-1-35)^2+(j-1)^2)/10-1/7));
        else 
            p(i,j)=0;
        end
    end
end;
p;
% ������Ա�������Ա�������,������Ա�˲�����ĸ���
q=zeros(71,51);
for i=1:71
    for j=1:51
        f(i,j)=x(i,j)*y(i,j);
        q(i,j)=f(i,j)*(1-p(i,j));
    end
end
q;

%%
figure('color',[1,1,1])
surf(x,y)
view([25.5 34]);
title('��в��')

% ����Ա�˵���ĸ���
figure('color',[1,1,1])
contour(p)
view([90 90]);
title('����Ա�˵���ĸ���')
% ������Ա�������Ա�������,������Ա�˲�����ĸ���
figure('color',[1,1,1])
contour(q)
title('����Ա�˲�����ĸ���')
axis([1,20,20,50])
view([90 90]);
% axis tight


