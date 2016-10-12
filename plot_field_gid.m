clear;clc;
%%
figure('pos',[600 100 620 700]);
grids=cell(8,1);
grids{1,1}=[10 10 0.1];
grids{2,1}=[10 10 0.2];
grids{3,1}=[10 10 0.5];
grids{4,1}=[10 10 1];
grids{5,1}=[10 10 1.25];
grids{6,1}=[10 10 2];
grids{7,1}=[10 10 2.5];
grids{8,1}=[10 10 5];
gid=[0.1 0.2 0.5 1 1.25 2 2.5 5];
linecolors = jet(8);

for i=1:1:8
    temp=0:gid(i):10;    
    [x,y] = meshgrid(temp);
    temp_num=(10/gid(i))+1;
    z=ones(temp_num,temp_num)*i;
    surf(x,y,z,'FaceColor','none','EdgeColor',linecolors(i,:),'linestyle',':','linewidth',2);
    hold on;
    
    rp_coordinates=get_rp_coordinates(grids{i,1});  
    x=rp_coordinates(:,1);
    y=rp_coordinates(:,2);
    rp_num=size(rp_coordinates,1);
    z=ones(rp_num,1)*i;
    scatter3(x,y,z,'MarkerFaceColor',linecolors(i,:));
    hold on;
    
end

% axis([0 10 0 10]);
set(gca,'xtick',1:1:10,'ytick',1:1:10,'zticklabel',{gid},'fontname','Times New Roman','fontsize',17,'fontweight','bold');
xlabel('Length (m)');
ylabel('Width (m)');
zlabel('GID (m)');
grid on;

%%
% % step 1: get grid
% grids=cell(8,1);
% grids{1,1}=[10 10 0.1];
% grids{2,1}=[10 10 0.2];
% grids{3,1}=[10 10 0.5];
% grids{4,1}=[10 10 1];
% grids{5,1}=[10 10 1.25];
% grids{6,1}=[10 10 2];
% grids{7,1}=[10 10 2.5];
% grids{8,1}=[10 10 5];
% 
% %%
% gid=[0.1 0.2 0.5 1 1.25 2 2.5 5];
% linecolors = jet(8);
% figure('pos',[600 100 620 700]);
% for i=1:8
%     grd=grids{i,1};
%     rp_coordinates=get_rp_coordinates(grd);  
%     x=rp_coordinates(:,1);
%     y=rp_coordinates(:,2);
%     rp_num=size(rp_coordinates,1);
%     z=ones(rp_num,1)*i;
%     scatter3(x,y,z,'MarkerFaceColor',linecolors(i,:));
%     hold on;
% end
% axis([0 9 0 9]);
% set(gca,'xtick',1:1:10,'ytick',1:1:10,'zticklabel',{gid},'fontname','Times New Roman','fontsize',10,'fontweight','bold');
% xlabel('Length (m)');
% ylabel('Width (m)');
% zlabel('GID (m)');
% grid on;