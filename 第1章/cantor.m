% ѡȡһ��ŷ�ϳ��ȵ�ֱ�߶Σ������߶����ȷ֣�ȥ���м�һ�Σ�ʣ�����Ρ�
% ��ʣ�µ����ηֱ������ȷ֣���ȥ���м�һ�Σ�ʣ���ĶΡ�
% �������Ĳ���������ȥ��ֱ�������ɵõ�һ����ɢ�ĵ㼯��
% ������������࣬��ŷ�ϳ��������㡣
% �����޲������ﵽ����ʱ���õ�����ɢ�㼯��֮ΪCantor����
function f=cantor(ax,ay,bx,by)
c=0.2;d=2;
if (bx-ax)>c
    x=[ax,bx];y=[ay,by];hold on;
    plot(x,y,'LineWidth',5);hold off;
    cx=ax+(bx-ax)/3;
    cy=ay-d;
    dx=bx-(bx-ax)/3;
    dy=by-d;
    ay=ay-d;
    by=by-d;
    cantor(ax,ay,cx,cy);
    cantor(dx,dy,bx,by);
end