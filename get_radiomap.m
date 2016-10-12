function [ fingerprint ] = get_radiomap( ap_coordinates, model_parameters, rp_coordinates )
%GET_FINGERPRINT Summary of this function goes here
%   Detailed explanation goes here

%only sample 1s for positioning
temp_parameters=[model_parameters(1:2,1);1];

% get fingerprint database
rp_number=size(rp_coordinates,1);
ap_number=size(ap_coordinates,1);
fingerprint=cell(rp_number,2);
for i=1:1:rp_number
    a_rp_coor=rp_coordinates(i,:);
    a_rp_finger=zeros(ap_number,2);
    for j=1:1:ap_number
        an_ap_coor=ap_coordinates(j,:);
        a_rp_finger(j,:)=get_model_rss(a_rp_coor, an_ap_coor, temp_parameters);
    end
    fingerprint{i,1}=a_rp_coor;
    fingerprint{i,2}=a_rp_finger;
end

end

