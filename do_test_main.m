function [ output_args ] = do_test_main( ap_coordinates, model_parameters, rp_coordinates, tp_coordinates )
%TEST_MAIN 

% get fingerprint database of reference points
fingerprint_database=get_fingerprint(ap_coordinates,model_parameters,rp_coordinates); % reference points
% get radiomap of testpoints
radio_map=get_radiomap(ap_coordinates,model_parameters,tp_coordinates); % test points
% positioning using nearest neighbor
tp_positioning_nn=cell2mat(get_position_nn(fingerprint_database,radio_map));
% positioning using probability
tp_positioning_prob=cell2mat(get_position_prob(fingerprint_database,radio_map));
% calculate positioning error
error_nn=get_position_error(tp_coordinates, tp_positioning_nn);
error_prob=get_position_error(tp_coordinates, tp_positioning_prob);
% combine result
% format: ap_number ap_coordinates model_parameters
%         fingerprint_database radio_map test_result
% where: test_result= { tp_coordinates tp_positioning_nn  error_nn
%        tp_positioning_prob error_prob }
ap_number=size(ap_coordinates,1);
output_args={ap_number ap_coordinates model_parameters fingerprint_database radio_map ...
    {tp_coordinates tp_positioning_nn  error_nn tp_positioning_prob error_prob}};

end

