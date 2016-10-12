function [ tp_coordinates ] = get_test_points( field, tp_number )
%GET_TEST_POINTS Summary of this function goes here
%   Detailed explanation goes here


xm=field(1,1)-1;ym=field(1,2)-1;
x=xm*rand(tp_number,1);
y=ym*rand(tp_number,1);
z=ones(tp_number,1);
tp_coordinates=[x,y,z];

end

