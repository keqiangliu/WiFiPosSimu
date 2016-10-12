clear;clc;
load test_result_apshape;
result=apshape_clean_result; 
color=[0 0 255; 0 139 0; 255 0 0;0 205 205; 205 0 205];
color=color/256;

%%
% plot nn rmse
clear -regexp [^result | color]; % clear all var but result
figure('pos',[600 300 950 380]);
subplot(1,2,1);
for i=1:5
    j1=(i-1)*100+1;j2=i*100;    
    x=cell2mat(result(j1:j2,1));
    y=cell2mat(result(j1:j2,5));
    if i==1
        scatter(x,y,30,'s','filled');hold on;
    elseif i==2
        scatter(x,y,50,'d','filled');hold on;
    elseif i==3
        scatter(x,y,50,'^','filled');hold on;
    elseif i==4
        scatter(x,y,50,'v','filled');hold on;
    elseif i==5
        scatter(x,y,30,'o','filled');hold on;
    end
end
title('Deterministic algorithm','fontname','Times New Roman','fontsize',13,'fontweight','bold');
legend('\sigma  = 1','\sigma  = 5','\sigma  = 8','\sigma  = 10','\sigma  = 15');
set(gca,'fontname','Times New Roman','fontsize',13,'fontweight','bold');
xlabel('CD (m)');
ylabel('RMSE(m)');
grid on;box on;
% plot prob rmse
subplot(1,2,2);
for i=1:5
    j1=(i-1)*100+1;j2=i*100;    
    x=cell2mat(result(j1:j2,1));
    y=cell2mat(result(j1:j2,7));
    if i==1
        scatter(x,y,30,'s','filled');hold on;
    elseif i==2
        scatter(x,y,50,'d','filled');hold on;
    elseif i==3
        scatter(x,y,50,'^','filled');hold on;
    elseif i==4
        scatter(x,y,50,'v','filled');hold on;
    elseif i==5
        scatter(x,y,30,'o','filled');hold on;
    end
end
title('Probabilistic algorithm','fontname','Times New Roman','fontsize',13,'fontweight','bold');
legend('\sigma  = 1','\sigma  = 5','\sigma  = 8','\sigma  = 10','\sigma  = 15');
set(gca,'fontname','Times New Roman','fontsize',13,'fontweight','bold');
xlabel('CD (m)');
ylabel('RMSE(m)');
grid on;box on;

%%

clear -regexp [^result | color];
noise_sigma=[1;5;8;10;15];
linecolors = jet(100);
figure('pos',[600 100 930 750]);

for i= 1:5
    j1=(i-1)*100+1;j2=i*100;
    
    %plot nn pdf
    subplot(5,2,2*i-1);    
    temp=sortrows(result(j1:j2,:),1);
    nn_error=temp(:,4);
    num=100;%100 test points
    for j=1:1:100
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
    temp=sortrows(result(j1:j2,:),1);
    prob_error=temp(:,6);
    num=100;%100 test points
    for j=1:1:100
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

temp=cell2mat(result(:,1));
xmin=roundn(min(temp),-2);xmax=roundn(max(temp),-2); %??
h=colorbar('SouthOutside');caxis([xmin xmax]);
set(get(h,'title'),'string','CD (m)','fontname','Times New Roman','fontsize',13,'fontweight','bold');
set(h,'fontname','Times New Roman','fontsize',10,'fontweight','bold');
set(h, 'Position', [.1 .05 .8150 .01]);

