clear;clc;
load test_result_time;
result=time_clean_result;
color=[0 0 255; 0 139 0; 255 0 0;0 205 205; 205 0 205];
color=color/256;

%%
% plot nn rmse
clear -regexp [^result | color ]; % clear all var but result
figure('pos',[600 300 620 500]);
for i=1:5
    j1=(i-1)*6+1;j2=i*6;
    x=1:6;
    y=cell2mat(result(j1:j2,4));
    if i==1
        plot(x,y,'-s','color',color(1,:),'linewidth',2,'markerfacecolor',color(1,:)); 
    elseif i==2
        plot(x,y,'-d','color',color(2,:),'linewidth',2,'markerfacecolor',color(2,:)); 
    elseif i==3
        plot(x,y,'-^','color',color(3,:),'linewidth',2,'markerfacecolor',color(3,:)); 
    elseif i==4
        plot(x,y,'-v','color',color(4,:),'linewidth',2,'markerfacecolor',color(4,:));  
    elseif i==5
        plot(x,y,'-o','color',color(5,:),'linewidth',2,'markerfacecolor',color(5,:));  
    end
    hold on;
end
legend('\sigma  = 1','\sigma  = 5','\sigma  = 8','\sigma  = 10','\sigma  = 15');
set(gca,'XTick',1:1:6,'xticklabel',{[4;20;40;60;120;240]},'fontname','Times New Roman','fontsize',17,'fontweight','bold');
xlabel('Time(s)');
ylabel('RMSE(m)');
axis([1 6 0 9]);
grid on;


%%
% % plot prob rmse
% clear -regexp [^result | color ]; % clear all var but result
% figure('pos',[600 300 620 500]);
% for i=1:5
%     j1=(i-1)*8+1;j2=i*8;
%     x=1:8;
%     y=cell2mat(result(j1:j2,6));
%     if i==1
%         plot(x,y,'-s','color',color(1,:),'linewidth',2,'markerfacecolor',color(1,:)); 
%     elseif i==2
%         plot(x,y,'-d','color',color(2,:),'linewidth',2,'markerfacecolor',color(2,:)); 
%     elseif i==3
%         plot(x,y,'-^','color',color(3,:),'linewidth',2,'markerfacecolor',color(3,:)); 
%     elseif i==4
%         plot(x,y,'-v','color',color(4,:),'linewidth',2,'markerfacecolor',color(4,:));  
%     elseif i==5
%         plot(x,y,'-o','color',color(5,:),'linewidth',2,'markerfacecolor',color(5,:));  
%     end
%     hold on;
% end
% legend('\sigma  = 1','\sigma  = 5','\sigma  = 8','\sigma  = 10','\sigma  = 15');
% set(gca,'XTick',1:1:8,'xticklabel',{gid},'fontname','Times New Roman','fontsize',17,'fontweight','bold');
% xlabel('GID(m)');
% ylabel('RMSE(m)');
% axis([1 8 0 9]);
% time on;


%%
% plot nn cdf
clear -regexp [^result | color];
noise_sigma=[1;5;8;10;15];
linecolors = jet(6);
figure('pos',[600 100 930 750]);
for i= 1:5
    subplot(5,1,i);
    j1=(i-1)*6+1;j2=i*6;
    nn_error=result(j1:j2,3);
    num=100;%100 test points
    text_coor=zeros(10,2);
    for j=1:1:6
        y=nn_error{j,1};
        [b x]=hist(y,10);%10 bins
        c=cumsum(b/num); 
        plot(x,c,'-','color',linecolors(j,:),'linewidth',1,'markerfacecolor',color(5,:)); 
        text_coor(j,:)=[x(5) c(5)];
        hold on;
    end
%     for j=1:1:20
%         text(text_coor(j,1),text_coor(j,2),num2str(j),'BackgroundColor','w','FontSize',8);
%         hold on;
%     end
    hco=colorbar();
    set(hco,'ytick',0:13:65,'yticklabel',{'4s' '20s' '40s' '60s' '120s' '240s'});
    axpos = get(hco,'Position');
    axpos(1,1)= axpos(1,1)+0.07;
    axpos(1,2)= axpos(1,2)+0.025;
    axpos(1,3)=0.5*axpos(1,3);
    axpos(1,4)=0.8*axpos(1,4);
    set(hco,'Position',axpos);
    legend(strcat('\sigma  = ',num2str(noise_sigma(i,1))),'Location','southeast');
    set(gca,'XTick',0:1:10,'fontname','Times New Roman','fontsize',10,'fontweight','bold');
    xlabel('PE(m)');
    ylabel('CNTP(%)');
    axis([0 10 0 1]);
    grid on;
end

%%
% % plot prob cdf
% clear -regexp [^result | color];
% noise_sigma=[1;5;8;10;15];
% linecolors = jet(8);
% figure('pos',[600 100 930 750]);
% for i= 1:5
%     subplot(5,1,i);
%     j1=(i-1)*8+1;j2=i*8;
%     prob_error=result(j1:j2,5);
%     num=100;%100 test points
%     text_coor=zeros(10,2);
%     for j=1:1:8
%         y=prob_error{j,1};
%         [b x]=hist(y,10);%10 bins
%         c=cumsum(b/num); 
%         plot(x,c,'-','color',linecolors(j,:),'linewidth',1,'markerfacecolor',color(5,:)); 
%         text_coor(j,:)=[x(5) c(5)];
%         hold on;
%     end
% %     for j=1:1:20
% %         text(text_coor(j,1),text_coor(j,2),num2str(j),'BackgroundColor','w','FontSize',8);
% %         hold on;
% %     end
%     hco=colorbar();
%     set(hco,'ytick',0:9.2857:65,'yticklabel',{'GID=0.1' 'GID=0.2' '' 'GID=1' '' 'GID=2' '' 'GID=5'});
%     axpos = get(hco,'Position');
%     axpos(1,1)= axpos(1,1)+0.07;
%     axpos(1,2)= axpos(1,2)+0.025;
%     axpos(1,3)=0.5*axpos(1,3);
%     axpos(1,4)=0.8*axpos(1,4);
%     set(hco,'Position',axpos);
%     legend(strcat('\sigma  = ',num2str(noise_sigma(i,1))),'Location','southeast');
%     set(gca,'XTick',0:1:10,'fontname','Times New Roman','fontsize',10,'fontweight','bold');
%     xlabel('PE(m)');
%     ylabel('CNTP(%)');
%     axis([0 10 0 1]);
%     time on;
% end

