% ·ÖÐÎÊ÷
clc,clear,close all
h=10;d=0.6;th=pi/4;n=9;
A=zeros(2,2^(n+1)-2);A(:,2)=[0;h];C=[cos(th) -sin(th);sin(th) cos(th)];D=inv(C);
for i=2:n
    B(:,2^(i-1)-1:2^i-2)=A(:,2^(i-1)-1:2^i-2);
    A(:,2^i-1:2^i+2^(i-1)-2)=d*C*B(:,2^(i-1)-1:2^i-2)+[0;h]*ones(1,2^i-2^(i-1));
    A(:,2^i+2^(i-1)-1:2^(i+1)-2)=d*D*B(:,2^(i-1)-1:2^i-2)+[0;h]*ones(1,2^i-2^(i-1));
end
for i=1:2^n-1
    L=line(A(1,[2*i-1 2*i]),A(2,[2*i-1 2*i]));set(L,'LineWidth',2);
end
