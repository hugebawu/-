function xvar = kvar(x)
[row,col] = size(x);
%x(abs(x)<0.001)=0;
blocks = 3;   % 3x3大小的窗口的方差
patch = (blocks-1)/2;
xvar = zeros(row,col);
xx = zeros(row+patch*2,col+patch*2);
xx((patch+1):(row+patch),(patch+1):(col+patch)) = x(:,:);
for r=1:row
    for c=1:col
        if x(row,col)~=0
            s_var = 0;
            avg = 0;
            for rr=r:(r+patch*2)
                for cc=c:(c+patch*2)               
                    avg = avg + xx(rr,cc);
                end
            end
            
            avg = avg/9;
            for rr=r:(r+patch*2)
                for cc=c:(c+patch*2)
                    s_var = s_var + (xx(rr,cc)-avg)^2;
                end
            end            
        
            xvar(r,c) = s_var;
        end
    end
end