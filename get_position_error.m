function [ output_args ] = get_position_error( tp_coors, tp_pos_coors )
%GET_POSITION_ERROR Summary of this function goes here
%   Detailed explanation goes here

output_args=get_mat_2norm(tp_coors-tp_pos_coors, 0);

end

