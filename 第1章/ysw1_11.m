clc,clear,close all
c=zeros(10,1);
cs=zeros(10,1);
lr=0;
for i=1:9
    c(i)=(100-lr)*rand(1);
    cs(i)=fix(c(i));
    lr=cs(i)+lr;
end
cs(10)=100-lr;
cs
%%
clc,clear,close all
warning off
cs=zeros(10,1);
while sum(cs)~=100
    c = rand(10,1);
    c1 = c./sum(c);
    cs = round(c1*100);  %  10个reader分别管控多少个tag，总和100
    if min(cs)==0
        cs=cs+100;
    end
end   
cs'
%%
clc,clear,close all
warning off
ans = rand;
while sum(ans)~=100
    randperm(55,10);
end
ans
sum(ans)



