function [ output_args ] = get_mat_2norm( input_mat, args  )
%GET_MAT_2NORM Summary of this function goes here
%   Detailed explanation goes here

if args==0 % calculate by rows
    dim=size(input_mat,1);
    output_args=zeros(dim,1);
    for i=1:dim
        output_args(i,1)=norm(input_mat(i,:));   
    end
elseif args==1 % calculate by columns
    dim=size(input_mat,2);
    output_args=zeros(1,dim);
    for i=1:dim
        output_args(1,i)=norm(input_mat(:,i));        
    end
end

end

