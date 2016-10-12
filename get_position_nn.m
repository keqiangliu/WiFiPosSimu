function [ output_args ] = get_position_nn(  fingerprint, radiomap )
%GET_POSITION_NN Summary of this function goes here
%   Detailed explanation goes here

% use matrix for calculation to reduce time consumption
rp_number=size(fingerprint,1);
fingerprint_mat=cell2mat(fingerprint(:,2)');
fingerprint_mat=fingerprint_mat(:,1:2:end); % only need rssi mean

tp_number=size(radiomap,1);
tp_positioing_coordinates=cell(tp_number,1);
for i=1:1:tp_number
   radiomap_mat=repmat(radiomap{i,2}(:,1),1,rp_number); 
   rssi_diff=fingerprint_mat-radiomap_mat;
   rssi_distance=get_mat_2norm(rssi_diff,1);
   rssi_min_dim=find(rssi_distance==min(rssi_distance));
%    fprintf('%f',rssi_min_dim);
   tp_positioing_coordinates(i,1)=fingerprint(rssi_min_dim(1),1);
end

output_args=tp_positioing_coordinates;

end

