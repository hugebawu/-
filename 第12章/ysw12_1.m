clc,clear,close all
warning off
% ���þ��ȷֲ����������ģ��
s = 1:365;
n=100;
pv=[];
for k=1:365
    success=0;
    for i=1:n % ��ÿһ��s��ʵ��n��
        y = floor(unifrnd(1,365,1,k)); % ����1��365֮��ľ��ȷֲ������k��
        % ����Ƿ�����ͬ��
        minl = min(y); maxl = max(y);
        for j=minl:maxl
            ii = find(y==j);
            if(length(ii)>1)
                success = success +1;
                break;
            end
        end
    end
    % �������
    pv(k)=success/n;
    % ���۸���
    gv =[];
end
for i=1:365
    gv(i)=1;
    for j=1:i
        gv(i)=gv(i)*(365-j+1)/365;
    end
    gv(i)=1-gv(i);
end
% ����ͼ��
hold on
box on
grid on
plot(s,pv,'.')
plot(s,gv,'r-','Linewidth',1.5)
legend('Ƶ��','����')
xlabel('��������ģ��')
hold offclc,clear,close all
warning off
% ���þ��ȷֲ����������ģ��
s = 1:365;
n=100;
pv=[];
for k=1:365
    success=0;
    for i=1:n % ��ÿһ��s��ʵ��n��
        y = floor(unifrnd(1,365,1,k)); % ����1��365֮��ľ��ȷֲ������k��
        % ����Ƿ�����ͬ��
        minl = min(y); maxl = max(y);
        for j=minl:maxl
            ii = find(y==j);
            if(length(ii)>1)
                success = success +1;
                break;
            end
        end
    end
    % �������
    pv(k)=success/n;
    % ���۸���
    gv =[];
end
for i=1:365
    gv(i)=1;
    for j=1:i
        gv(i)=gv(i)*(365-j+1)/365;
    end
    gv(i)=1-gv(i);
end
% ����ͼ��
hold on
box on
grid on
plot(s,pv,'.')
plot(s,gv,'r-','Linewidth',1.5)
legend('Ƶ��','����')
xlabel('��������ģ��')
hold off




