%�Ӻ������ж��ܷ����λ�ã�x,y��
function p=canPlace(x,y)
global Indexes;
%�ж��Ƿ�ṥ���ѷ��õĻʺ�λ��ͬһ�Խ��߻�ͬһ�����ϣ�
for a=1:x-1%aΪ�к�
    b=Indexes(a);%bΪ�ѷ��ûʺ������к�
    %         if (x-y==a-b || x+y==a+b || x==a || y==b)%�ж��Ƿ�λ��ͬһ�Խ��ߺ�ͬһ������
    if (x-y==a-b || x+y==a+b || y==b)%�ж��Ƿ�λ��ͬһ�Խ��ߺ�ͬһ���ϣ�^_^
        p=0;
        return;%�˳��Ӻ���
    end
end
p=1;
end