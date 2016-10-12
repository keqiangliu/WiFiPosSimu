close all;clear;clc;
color=[0 0 255; 0 139 0; 255 0 0;0 205 205; 205 0 205];
color=color/256;

%% plot apn
load test_result_apn;
result=apn_clean_result;
x=1:20;
jmax=size(result,2);
temp_nn=cell2mat(result(:,jmax-3)');
mean_val=mean(temp_nn)';
std_val=std(temp_nn)';

figure('pos',[600 300 950 380]);
for i=1:5
    j1=(i-1)*20+1;j2=i*20;
    y=mean_val(j1:j2,1);
    z=std_val(j1:j2,1);
    if i==1
        errorbar(x,y,z,'color',color(1,:),'linewidth',2); 
    elseif i==2
        errorbar(x,y,z,'color',color(2,:),'linewidth',2); 
    elseif i==3
        errorbar(x,y,z,'color',color(3,:),'linewidth',2); 
    elseif i==4
        errorbar(x,y,z,'color',color(4,:),'linewidth',2);  
    elseif i==5
        errorbar(x,y,z,'color',color(5,:),'linewidth',2);  
     end    
    hold on;
end
