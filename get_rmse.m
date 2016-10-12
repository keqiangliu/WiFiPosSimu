function [ output_args ] = get_rmse( input_args )
%GET_RMSE Summary of this function goes here
%   Detailed explanation goes here
output_args=sqrt(mean(input_args.^2));

end

