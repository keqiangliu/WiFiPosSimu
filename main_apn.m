clear;clc;
%%
% step 1: get ap coordinates

aps{1,1}=[0 0 3];
aps{2,1}=[0 0 3;10 10 3];
aps{3,1}=[0 0 3;5 10 3;10 0 3];
aps{4,1}=[0 0 3;0 10 3;10 10 3;10 0 3];
aps{5,1}=[0 0 3;0 5 3;0 10 3;10 10 3;10 0 3]; %[0 6 3;4.5 9 3;9 6 3;7 0 3;2 0 3];
aps{6,1}=[0 0 3;0 5 3;0 10 3;10 10 3;10 5 3;10 0 3];
aps{7,1}=[0 0 3;0 5 3;0 10 3;5 10 3;10 10 3;10 5 3;10 0 3];
aps{8,1}=[0 0 3;0 5 3;0 10 3;5 10 3;10 10 3;10 5 3;10 0 3;...
          5 0 3];
aps{9,1}=[0 0 3;0 3 3;0 6 3;0 10 3;5 10 3;10 10 3;...
          10 5 3;10 0 3;5 0 3];
aps{10,1}=[0 0 3;0 3 3;0 6 3;0 10 3;5 10 3;...
          10 10 3;10 6 3;10 3 3;10 0 3;5 0 3];

aps{11,1}=[0 0 3;0 3 3;0 6 3;0 10 3;5 10 3;...
          10 10 3;10 6 3;10 3 3;10 0 3;3 0 3;6 0 3];
aps{12,1}=[0 0 3;0 3 3;0 6 3;0 10 3;3 10 3;6 10 3;...
          10 10 3;10 6 3;10 3 3;10 0 3;3 0 3;6 0 3];
aps{13,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 10 3;3 10 3;6 10 3;...
          10 10 3;10 6 3;10 3 3;10 0 3;3 0 3;6 0 3];
aps{14,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 10 3;3 10 3;6 10 3;...
          10 10 3;10 7 3;10 5 3;10 3 3;10 0 3;3 0 3;6 0 3];      
aps{15,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 10 3;2 10 3;4 10 3;6 10 3;...
          10 10 3;10 7 3;10 5 3;10 3 3;10 0 3;3 0 3;6 0 3];       
 
aps{16,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 10 3;2 10 3;4 10 3;6 10 3;...
          10 10 3;10 7 3;10 5 3;10 3 3;10 0 3;7 0 3;5 0 3;3 0 3];
aps{17,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 8 3;0 10 3;2 10 3;4 10 3;6 10 3;...
          10 10 3;10 7 3;10 5 3;10 3 3;10 0 3;7 0 3;5 0 3;3 0 3]; 
aps{18,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 8 3;0 10 3;2 10 3;4 10 3;6 10 3;...
          10 10 3;10 7 3;10 5 3;10 3 3;10 1 3;10 0 3;7 0 3;5 0 3;3 0 3]; 
aps{19,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 8 3;0 10 3;2 10 3;4 10 3;6 10 3;8 10 3;...
          10 10 3;10 7 3;10 5 3;10 3 3;10 1 3;10 0 3;7 0 3;5 0 3;3 0 3];
aps{20,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 8 3;0 10 3;2 10 3;4 10 3;6 10 3;8 10 3;...
          10 10 3;10 7 3;10 5 3;10 3 3;10 1 3;10 0 3;7 0 3;5 0 3;1 0 3;3 0 3]; 
       
%%
% step 2: get rp coordinates 
grid=[10 10 1];
rp_coordinates=get_rp_coordinates(grid);
sample_time=240;

%% 
% step 3: set propagate model
noise_sigma=[1;5;8;10;15];
attenuation_n=2;

%% 
% step 4: generate test points coordinates
tp_number=100;
field=[10 10];
tp_coordinates=get_test_points( field, tp_number );

%%
% step 5: test for ap number
imax=size(noise_sigma,1);
jmax=size(aps,1);
apn_test_result=cell(imax*jmax,6);
hwait=waitbar(0,'TESTING...');
for i= 1:1:imax
    % set model parameters vector
    model_parameters=[attenuation_n;noise_sigma(i,1);sample_time];
    for j= 1:1:jmax
        ap_coordinates=aps{j,1};
        k=(i-1)*jmax+j;
        waitbar(k/(imax*jmax),hwait,'TESTING...');
        % format: ap_number ap_coordinates model_parameters
        %         fingerprint_database radio_map test_result
        % where: test_result= { tp_coordinates tp_positioning_nn  error_nn
        %        tp_positioning_prob error_prob }
        apn_test_result(k,:)=do_test_main( ap_coordinates, model_parameters, rp_coordinates, tp_coordinates );
    end
end
close(hwait);

%%
% step 6: clean data
imax=size(apn_test_result,1);
apn_clean_result=cell(imax,7);
apn_clean_result(:,1)=apn_test_result(:,1);
hwait=waitbar(0,'DATA CLEANING...');
for i=1:imax
    attenuation_temp=apn_test_result{i,3}(1,1);
    sigma_temp=apn_test_result{i,3}(2,1);
    temp1=apn_test_result{i,6}{1,3};
    nn_rmse=get_rmse(temp1);
    temp2=apn_test_result{i,6}{1,5};
    prob_rmse=get_rmse(temp2);
    %result format:
    %cd cv sigma nn_error nn_rmse prob_error prob_rmse
    apn_clean_result(i,2:7)={attenuation_temp sigma_temp temp1 nn_rmse temp2 prob_rmse};
    waitbar(i/imax,hwait,'DATA CLEANING...');
end
close(hwait);

%%
save test_result_apn.mat apn_test_result apn_clean_result;
clear;clc;
% clear -regexp [^result]; % clear all var but result
fprintf('%s\n','APN test finished!');

%%
%{
aps{1,1}=[0 0 3];
aps{2,1}=[0 0 3;9 9 3];
aps{3,1}=[0 0 3;4.5 9 3;9 0 3];
aps{4,1}=[0 0 3;0 9 3;9 0 3;9 9 3];
aps{5,1}=[0 0 3;0 9 3;9 0 3;9 9 3;0 4.5 3];
aps{6,1}=[0 0 3;0 4.5 3;0 9 3;9 0 3;9 4.5 3;9 9 3];
aps{7,1}=[0 0 3;0 4.5 3;0 9 3;9 0 3;9 4.5 3;9 9 3;4.5 9 3];
aps{8,1}=[0 0 3;0 9 3;9 0 3;9 9 3;...
          0 4.5 3;4.5 0 3;9 4.5 3;4.5 9 3];
aps{9,1}=[0 0 3;0 9 3;9 0 3;9 9 3;...
          0 3 3;0 6 3;4.5 0 3;9 4.5 3;4.5 9 3];
aps{10,1}=[0 0 3;0 3 3;0 6 3;0 9 3;4.5 9 3;...
          9 9 3;9 6 3;9 3 3;9 0 3;4.5 0 3];

aps{11,1}=[0 0 3;0 3 3;0 6 3;0 9 3;4.5 9 3;...
          9 9 3;9 6 3;9 3 3;9 0 3;3 0 3;6 0 3];
aps{12,1}=[0 0 3;0 3 3;0 6 3;0 9 3;3 9 3;6 9 3;...
          9 9 3;9 6 3;9 3 3;9 0 3;3 0 3;6 0 3];
aps{13,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 9 3;3 9 3;6 9 3;...
          9 9 3;9 6 3;9 3 3;9 0 3;3 0 3;6 0 3];
aps{14,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 9 3;3 9 3;6 9 3;...
          9 9 3;9 7 3;9 5 3;9 3 3;9 0 3;3 0 3;6 0 3];      
aps{15,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 9 3;2 9 3;4 9 3;6 9 3;...
          9 9 3;9 7 3;9 5 3;9 3 3;9 0 3;3 0 3;6 0 3];       
 
aps{16,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 9 3;2 9 3;4 9 3;6 9 3;...
          9 9 3;9 7 3;9 5 3;9 3 3;9 0 3;7 0 3;5 0 3;3 0 3];
aps{17,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 8 3;0 9 3;2 9 3;4 9 3;6 9 3;...
          9 9 3;9 7 3;9 5 3;9 3 3;9 0 3;7 0 3;5 0 3;3 0 3]; 
aps{18,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 8 3;0 9 3;2 9 3;4 9 3;6 9 3;...
          9 9 3;9 7 3;9 5 3;9 3 3;9 1 3;9 0 3;7 0 3;5 0 3;3 0 3]; 
aps{19,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 8 3;0 9 3;2 9 3;4 9 3;6 9 3;8 9 3;...
          9 9 3;9 7 3;9 5 3;9 3 3;9 1 3;9 0 3;7 0 3;5 0 3;3 0 3];
aps{20,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 8 3;0 9 3;2 9 3;4 9 3;6 9 3;8 9 3;...
          9 9 3;9 7 3;9 5 3;9 3 3;9 1 3;9 0 3;7 0 3;5 0 3;1 0 3;3 0 3];  
%}
