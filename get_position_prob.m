function [ output_args ] = get_position_prob( fingerprint, radiomap )
%GET_POSITION_PROB Summary of this function goes here
%   Detailed explanation goes here

% use matrix for calculation to reduce time consumption
rp_number=size(fingerprint,1);
fingerprint_mat=cell2mat(fingerprint(:,2)');
mu_mat=fingerprint_mat(:,1:2:end);
sigma_mat=fingerprint_mat(:,2:2:end);

tp_number=size(radiomap,1);
tp_positioing_coordinates=cell(tp_number,1);
for i=1:1:tp_number
   probability=zeros(1,rp_number);
   for j=1:1:rp_number
       pdf_temp=normpdf(radiomap{i,2}(:,1),mu_mat(:,j),sigma_mat(:,j));
       probability(1,j)=prod(pdf_temp);
   end
   prob_max_dim=find(probability==max(probability));
   tp_positioing_coordinates(i,1)=fingerprint( prob_max_dim(1),1);
end

output_args=tp_positioing_coordinates;














end

