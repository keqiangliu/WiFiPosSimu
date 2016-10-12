function [ rp_coordinates ] = get_rp_coordinates( grid )
%GET_RP_COORDINATES 

% Test field is a grid(1,1) multipy grid(1,2) square area
% Grid interval distance(gid)=grid(1,3)
xmax=grid(1,1);ymax=grid(1,2);gid=grid(1,3); 
%
rp_number=((xmax/gid)+1)*((ymax/gid)+1); 
% rp height is 1m thus use ones()
rp_coordinates=ones(rp_number,3); 
% get grid coordinates
A=0:gid:xmax;B=0:gid:ymax;
[m,n]=meshgrid(A,B');
[m,n]=deal(reshape(m,[],1),reshape(n,[],1));
% return
rp_coordinates(:,1:2)=[m,n];

end

