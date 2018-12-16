function [f,df1,df2]=jt(x,x2)
f=8*x.*x+9*x2.*x2-10*x.*x2-12*x-6*x2;
if nargout>1
    df1=2*8*x-10*x2-12*ones(size(x));
    df2=2*8*x2-10*x-12*ones(size(x2));
end