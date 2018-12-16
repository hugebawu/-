function xresult = kconsist(x)
% һ������֤���������˲��������x(r,c)��3x3��������>=5����i����x(r,c)=i
if ndims(x)==3
    xresult = zeros(size(x,2),size(x,3));
    xresult(:) = x(:);
    x = xresult;
else
    xresult = x;
end  
[row,col] = size(x);
blocks = 3;   % 3x3��С�Ĵ���
thr = 5;
patch = (blocks-1)/2;
count = max(x(:));
x_count = zeros(1,count);

for r=(patch+1):(row-patch)
    for c=(patch+1):(col-patch)
        x_count(:) = 0;
        rr = r-patch;
        while rr<=r+patch
            cc = c-patch;
            while cc<=c+patch
                x_count(x(rr,cc)) = x_count(x(rr,cc)) + 1;
                if x_count(x(rr,cc)) >= thr  % �˳�ѭ��
                    xresult(r,c) = x(rr,cc);
                    rr = r+patch;
                    cc = c+patch;
                end
                cc = cc+1;
            end
            rr = rr + 1;
        end
    end
end

