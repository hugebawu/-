clc,clear,close all
warning off
k=1;
for x=1:5:20
    for y=1:5:20
        a = (10*x+y)*(10*x+(10-y));
        b=100*x*(x+1)+y*(10-y);
        c(k)=a-b;
        k=k+1;
    end
end
c

%% Èý½×»Ã·½
clc,clear,close all
warning off
magic(1)
magic(2)
magic(3)
magic(4)


