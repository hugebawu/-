function Q= Queens(n)
global Indexes;
A=ones(n,n);%��ʼ������
Indexes=zeros(1,n);%��¼�ʺ��λ������
i=1;%�к�
j=1;%�к�
count=0;%ͳ�ƽ�ĸ���
while (i>0)
    while j<=n
        if canPlace(i,j)%�Ҳ��ṥ�������ʺ��λ��
            A(i,j)=8;%8����ʺ�
            Indexes(i)=j;
            break;%������ѭ��
        else
            j=j+1;%̽����һ��λ��
        end
    end
   
    if j<=n%����ҵ����ʵ�λ�ã�������һ��
        i=i+1;
        j=1;
    else%����Ҳ������ʵ�λ�ã�����ݣ��˻ص���һ��
        i=i-1;
        if i~=0
            j=Indexes(i);
            A(i,j)=1;%��ԭֵ
            Indexes(i)=0;%ȥ������������
            j=j+1;%����һ���ʺ�ĺ���һ��λ�ÿ�ʼ��
        end
    end
   
    if (Indexes(n)~=0)%����ҵ�һ����
        count=count+1;
        disp(A);%�������
    end
end
disp([num2str(n),'�ʺ������ĸ���Ϊ:',num2str(count)]);%�����ĸ���
end


