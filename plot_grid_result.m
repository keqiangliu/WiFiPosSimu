close all;clear;clc;
load test_result_grid;
result=grid_clean_result;
color=[0 0 255; 0 139 0; 255 0 0;0 205 205; 205 0 205];
color=color/256;
gid=[0.1 0.2 0.5 1 1.25 2 2.5 5];

%%
% plot nn rmse
clear -regexp [^result | color | gid]; % clear all var but result
figure('pos',[600 300 950 380]);

subplot(1,2,1);
for i=1:5
    j1=(i-1)*8+1;j2=i*8;
    x=1:8;
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
title('Deterministic algorithm','fontname','Times New Roman','fontsize',13,'fontweight','bold');
legend('\sigma  = 1','\sigma  = 5','\sigma  = 8','\sigma  = 10','\sigma  = 15');
set(gca,'XTick',1:1:8,'xticklabel',{gid},'fontname','Times New Roman','fontsize',13,'fontweight','bold');
xlabel('GID(m)');
ylabel('RMSE(m)');
axis([1 8 0 11]);
grid on;

% plot prob rmse
subplot(1,2,2);
for i=1:5
    j1=(i-1)*8+1;j2=i*8;
    x=1:8;
    y=cell2mat(result(j1:j2,6));
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
title('Probabilistic algorithm','fontname','Times New Roman','fontsize',13,'fontweight','bold');
legend('\sigma  = 1','\sigma  = 5','\sigma  = 8','\sigma  = 10','\sigma  = 15');
set(gca,'XTick',1:1:8,'xticklabel',{gid},'fontname','Times New Roman','fontsize',13,'fontweight','bold');
xlabel('GID(m)');
ylabel('RMSE(m)');
axis([1 8 0 11]);
grid on;

%%

clear -regexp [^result | color |gid];
noise_sigma=[1;5;8;10;15];
linecolors = jet(8);
figure('pos',[600 100 930 750]);

for i= 1:5
    j1=(i-1)*8+1;j2=i*8;
    
    %nn
    subplot(5,2,2*i-1);     
    nn_error=result(j1:j2,3);
    num=100;%100 test points
    for j=1:1:8
        y=nn_error{j,1};
        [b x]=hist(y,10);%10 bins
        c=cumsum(b/num); 
        plot(x,c,'-','color',linecolors(j,:),'linewidth',1,'markerfacecolor',color(5,:)); 
        hold on;
    end
    
    if i==1
        title('Deterministic algorithm','fontname','Times New Roman','fontsize',13,'fontweight','bold');
    end
    legend(strcat('\sigma  = ',num2str(noise_sigma(i,1))),'Location','southeast');
    set(gca,'XTick',0:1:10,'fontname','Times New Roman','fontsize',13,'fontweight','bold');
     xlabel('\Delta\it\bf p\rm\bf (m)');
    ylabel('CNTP(%)');
    axis([0 10 0 1]);
    grid on;

% plot prob cdf
	subplot(5,2,2*i);
    prob_error=result(j1:j2,5);
    num=100;%100 test points
    for j=1:1:8
        y=prob_error{j,1};
        [b x]=hist(y,10);%10 bins
        c=cumsum(b/num); 
        plot(x,c,'-','color',linecolors(j,:),'linewidth',1,'markerfacecolor',color(5,:)); 
        hold on;
    end
   
    if i==1
        title({'Probabilistic algorithm'},'fontname','Times New Roman','fontsize',13,'fontweight','bold');
    end
    legend(strcat('\sigma  = ',num2str(noise_sigma(i,1))),'Location','southeast');
    set(gca,'XTick',0:1:10,'fontname','Times New Roman','fontsize',13,'fontweight','bold');
     xlabel('\Delta\it\bf p\rm\bf (m)');
    ylabel('CNTP(%)');
    axis([0 10 0 1]);
    grid on;
end

h=colorbar('SouthOutside');caxis([1 8]);
set(get(h,'title'),'string','GID(m)','fontname','Times New Roman','fontsize',13,'fontweight','bold');
set(h,'xtick',1:1:8,'xticklabel',{gid},'fontname','Times New Roman','fontsize',13,'fontweight','bold');
set(h, 'Position', [.1 .05 .8150 .01]);
