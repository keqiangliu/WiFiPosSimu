function [ output_rssi ] = get_model_rss( a_rp_coordinate, an_ap_coordinate,  model_parameters )
%GET_MODEL_RSS Summary of this function goes here
%   Detailed explanation goes here
% model: pl(d)=pl(d0)+10*n*log10(d/d0)+X(del)
% where: n is attenuation factor in model_parameters(1,1)
%       x~N(0,del) del is standard deviation in model_parameters(2,1)
% RSSI: pr=pt-pl(d)

%default value:pt=20(dBm), and pl0=pl(d0)=pl(1m)=40.2(dB)
% pt=20;pl0=40.2;20-40.2=
% n=model_parameters(1,1);
% del=model_parameters(2,1);
distance=norm(an_ap_coordinate-a_rp_coordinate);

% simulate time 240s = 60s * 4 oritation
rssi_mat=20-40.2-10*model_parameters(1,1)*log10(distance)+normrnd(0,model_parameters(2,1),model_parameters(3,1),1); 

output_rssi=[mean(rssi_mat) std(rssi_mat)];
end

