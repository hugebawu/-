function MA=swap(ma)
ma1=ma;
Nma=size(ma,2);
maij=(Nma(1,1):-1:1)';
[ma(1,:),ma(maij)] = deal(ma(1,maij),ma(1,:));
MA=ma;
ma=ma1;