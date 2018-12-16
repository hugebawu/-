function f=Koch_2(ax,ay,bx,by,c)

    if (bx-ax)^2+(by-ay)^2<c
        x=[ax,bx];y=[ay,by];
        plot(x,y);hold on;
    else
        cx=ax+(bx-ax)/3;   cy=ay+(by-ay)/3;
        ex=bx-(bx-ax)/3;   ey=by-(by-ay)/3;
        l=sqrt((ex-cx)^2+(ey-cy)^2);
        alpha=atan((ey-cy)/(ex-cx));
        if (alpha>=0&(ex-cx)<0)|(alpha<=0&(ex-cx)<0)
            alpha=alpha+pi;
        end
        
%         dy=cy+sin(alpha+pi/3)*l;
%         dx=cx+cos(alpha+pi/3)*l;
        val=rand();
        if val<0.95
            vv=1;
        else
            vv=-1;
        end
        dy=cy+sin(alpha+vv*pi/3)*l;
        dx=cx+cos(alpha+vv*pi/3)*l;

        Koch(ax,ay,cx,cy,c);
        Koch(ex,ey,bx,by,c);
        Koch(cx,cy,dx,dy,c);
        Koch(dx,dy,ex,ey,c);
    end
end