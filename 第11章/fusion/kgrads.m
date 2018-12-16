function xresult = kgrads(x,d)
% �����ݶȣ� d='h'�����������֮�䣬���з����ϵĲ��죨�ݶȣ�����ˮƽ�ı�Ե
if ndims(x)==3
    xresult = zeros(size(x,2),size(x,3));
    xresult(:) = x(:);
    x = xresult;
elseif ndims(x)==4
    xresult = zeros(size(x,3),size(x,4));
    xresult(:) = x(:);
    x = xresult;
else
    xresult = x;
end
[row,col] = size(x);
blocks = 3;   % 3x3��С�Ĵ��ڵĲ�ֵ�ƽ����

% ������
if d=='v' 
    for r=1:row 
        for c=1:(col-1)
            xresult(r,c) = (xresult(r,c) - xresult(r,c+1))^2; % ������֮�䣬���з����ϵĲ���
        end
        xresult(r,col) = xresult(r,col-1);
    end
else
    for c=1:col 
        for r=1:(row-1)
            xresult(r,c) = (xresult(r,c) - xresult(r+1,c))^2; % ������֮�䣬���з����ϵĲ���
        end
        xresult(row,c) = xresult(row-1,c);
    end
end

patch = (blocks-1)/2;
xx = zeros(row+patch*2,col+patch*2);
xx((patch+1):(row+patch),(patch+1):(col+patch)) = xresult(:,:);

for r=1:row
    for c=1:col
        s_grads = 0;
        for rr=r:(r+patch*2)
            for cc=c:(c+patch*2)               
                s_grads = s_grads + xx(rr,cc);
            end
        end
        xresult(r,c) = s_grads;
    end
end