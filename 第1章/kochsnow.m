function f=kochsnow(l,c)
ax=0;ay=0;bx=l;by=0;
cx=l/2;
cy=l*sqrt(3)/2;
Koch(ax,ay,cx,cy,c);
Koch(cx,cy,bx,by,c);
Koch(bx,by,ax,ay,c);
end