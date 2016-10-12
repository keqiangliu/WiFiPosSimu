clear;clc;

%%
% step 1: get ap coordinates
aps=[0 0 3;0 9 3;9 0 3;9 9 3;...
          0 4.5 3;4.5 0 3;9 4.5 3;4.5 9 3];

%%
% step 2: get rp coordinates     
time=[10 10 1];
rp_coordinates=get_rp_coordinates(time);

sample_time=[4;20;40;60;120;240];

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
jmax=size(sample_time,1);
time_test_result=cell(imax*jmax,6);
ap_coordinates=aps;
hwait=waitbar(0,'TESTING...');
for i= 1:1:imax    
    for j= 1:1:jmax
        % set model parameters vector
        model_parameters=[attenuation_n;noise_sigma(i,1);sample_time(j,1)];
        k=(i-1)*jmax+j;
        waitbar(k/(imax*jmax),hwait,'TESTING...');
        time_test_result(k,:)=do_test_main( ap_coordinates, model_parameters, rp_coordinates, tp_coordinates );
    end
end
close(hwait);

%%
% step 6: clean data
imax=size(time_test_result,1);
time_clean_result=cell(imax,6);
hwait=waitbar(0,'DATA CLEANING...');
for i=1:imax
    k=fix((i-1)/6)+1;
    sigma_temp=time_test_result{i,3}(2,1);
    sample_time=time_test_result{i,3}(3,1);
    temp1=time_test_result{i,6}{1,3};
    nn_rmse=get_rmse(temp1);
    temp2=time_test_result{i,6}{1,5};
    prob_rmse=get_rmse(temp2);
    %result format:
    %gid sigma nn_error nn_rmse prob_error prob_rmse
    time_clean_result(i,:)={sample_time sigma_temp temp1 nn_rmse temp2 prob_rmse};
    waitbar(i/imax,hwait,'DATA CLEANING...');
end
close(hwait);

%%
save test_result_time.mat time_test_result time_clean_result;
clear;clc;
fprintf('%s\n','Sample time test finished!');
