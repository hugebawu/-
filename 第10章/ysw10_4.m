%̨��ģ�����
clc,clear,close all
warning off
figure('color',[1,1,1])
axis([-1.6,12.6,-1.6,10.7])%ȷ�������������Χ
 hold on %���ֵ�ǰͼ�μ���ϵ����������
 fill([-2,13,13,-2],[-2,-2,11,11],[0,1,0]);%����������
 fill([-1,12,12,-1],[-1,-1,10,10],[0,0.5,0]);%����������
 ball1=line(0,5,'color','r','marker','.','erasemode','xor','markersize',60);%����С����ɫ,��С,�����Ĳ��÷�ʽ
 ball2=line(8,9,'color','g','marker','.','erasemode','xor','markersize',60);%����С����ɫ,��С,�����Ĳ��÷�ʽ
 ball3=line(-1,-1,'color','g','marker','.','erasemode','xor','markersize',80);%�������½�Բ����ɫ,��С,�����Ĳ��÷�ʽ
 ball4=line(12,-1,'color','g','marker','.','erasemode','xor','markersize',80);%�������½�Բ����ɫ,��С,�����Ĳ��÷�ʽ
 ball3=line(-1,10,'color','g','marker','.','erasemode','xor','markersize',80);%�������Ͻ�Բ����ɫ,��С,�����Ĳ��÷�ʽ
 ball4=line(12,10,'color','g','marker','.','erasemode','xor','markersize',80);%�������Ͻ�Բ����ɫ,��С,�����Ĳ��÷�ʽ
 
 title('̨��ģ���˶�����', 'color','r','fontsize',15);%ͼ�α���
 pause(1)%�趨��ͣʱ��ĳ���
 t=0;dt=0.005;%���Ƴ�ʼ��ֵ
 while t<7.2%�趨���᷶Χ
     t=t+dt;%���ƺ�����㹫ʽ
     y=1/2*t+5;%����������㹫ʽ
      set(ball1,'xdata',t,'ydata',y)%��������˶�
   drawnow;%ˢ����Ļ
 end  %����
 while t<8.8%�趨���᷶Χ
     t=t+dt;%���ƺ�����㹫ʽ
     y=1/2*t+5;%����������㹫ʽ
      set(ball2,'xdata',t,'ydata',y)%��������˶�
   drawnow;%ˢ����Ļ
 end  %����
 while t<11.5%�趨���᷶Χ
     t=t+dt;%���ƺ�����㹫ʽ
     y=-1/2*t+14.3;%����������㹫ʽ
      set(ball2,'xdata',t,'ydata',y)%��������˶�
   drawnow;%ˢ����Ļ
 end%����
 while t>-0.5%���ƺ��᷶Χ
     t=t-dt;%���ƺ�����㹫ʽ
     y=1/2*t+2.90;%����������㹫ʽ
      set(ball2,'xdata',t,'ydata',y)%��������˶�
   drawnow;%ˢ����Ļ
 end%����
 while t<6%���ƺ��᷶Χ
     t=t+dt;%���ƺ�����㹫ʽ
     y=-1/2*t+2.40;%����������㹫ʽ
      set(ball2,'xdata',t,'ydata',y)%��������˶�
   drawnow;%ˢ����Ļ
 end%����
 while t<11.5%���ƺ��᷶Χ
     t=t+dt;%���ƺ�����㹫ʽ
     y=1/2*t-3.0;%����������㹫ʽ
      set(ball2,'xdata',t,'ydata',y)%��������˶�
   drawnow;%ˢ����Ļ
 end%����
 while t>-2%���ƺ��᷶Χ
     t=t-dt;%���ƺ�����㹫ʽ
     y=-t*7.65/12.9+9.57;%����������㹫ʽ
      set(ball2,'xdata',t,'ydata',y)%��������˶�
   drawnow;%ˢ����Ļ
 end%����
 text(2,5,'��ϲ�������˰���','fontsize',16,'color','r'); %��ʾ��Ļ����ɫ�ʹ�С
 
