clear;clc;

figure('pos',[600 200 620 650]);

aps=[5 5 0;5 5 1;0 0 3;10 0 3;5 5 1;10 10 3;0 10 3;5 5 1];
x=aps(:,1);y=aps(:,2);z=aps(:,3);
% plot3(x,y,z,'-s','Color',linecolors(j,:),'linewidth',2);hold on;
plot3(x,y,z,'k--s','linewidth',2); 
% scatter3(x,y,z);



axis([0 10 0 10 0 3]);
set(gca,'xtick',0:1:10,'ytick',0:1:10,'fontname','Times New Roman','fontsize',16,'fontweight','bold');
xlabel('Length (m)');
ylabel('Width (m)');
zlabel('Height (m)');
grid on;box on;
    
% plot(5,5,'rs');
% x=[0 5 0];y=[0 5 10];z=[3 1 3];
% plot3(x,y,z,'k--s'); 
% x=[10 5 10];y=[0 5 10];z=[3 1 3];
% plot3(x,y,z,'k--s'); 
% x=[5 5];y=[5 5];z=[0 1];
% plot3(x,y,z,'k--'); 
% x=[5 5 1];
% plot3(5,5,1,'ro');

% 
% 
% axis([0 10 0 10]);
% grid on;
% box on;
% set(gca,'XTick',0:1:10);
% set(gca,'YTick',0:1:10);
% 
% xlabel('X');
% hold on;
% ylabel('Y');
% 
% hold on;




















% clear result;
% 
% % ≤ªÕ¨n≤‚ ‘
% ap=[0 0 3;0 9 3;9 0 3;9 9 3];
% 
% grid=[10 10 1];
% del=2;
% % dels=[10;15;20;25];
% % ns=[1.5;2;2.5;3;3.5;4;4.5;5;5.5;6];
% result=cell(1,4);
% rn=1;
% 
% % for nap=1:1:5
% %     ap=aps{nap,1};
% %     for nn=1:1:10
% %         n=ns(nn,1);
%         [fp,tp,res]=test(grid,ap,del);
%         result{rn,1}=fp;
%         result{rn,2}=tp;
%         result{rn,3}=res;
%         result{rn,4}=del;
% %         result{rn,5}=n;
% %         rn=rn+1;
% %     end
% % end
% 
% fprintf('%s','done!');
% clear grid aps dels rn ndel del nap ap fp tp res n nn;