clear;clc;

%%
% step 1: get ap coordinates
aps=[0 0 3;0 10 3;10 0 3;10 10 3;...
          0 5 3;5 0 3;10 5 3;5 10 3];

%%
% step 2: get rp coordinates     
grids=cell(8,1);
grids{1,1}=[10 10 0.1];
grids{2,1}=[10 10 0.2];
grids{3,1}=[10 10 0.5];
grids{4,1}=[10 10 1];
grids{5,1}=[10 10 1.25];
grids{6,1}=[10 10 2];
grids{7,1}=[10 10 2.5];
grids{8,1}=[10 10 5];
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
jmax=size(grids,1);
grid_test_result=cell(imax*jmax,6);
ap_coordinates=aps;
hwait=waitbar(0,'TESTING...');
for i= 1:1:imax
    % set model parameters vector
    model_parameters=[attenuation_n;noise_sigma(i,1);sample_time];
    for j= 1:1:jmax
        grid=grids{j,1};
        rp_coordinates=get_rp_coordinates(grid);  
        k=(i-1)*jmax+j;
        waitbar(k/(imax*jmax),hwait,'TESTING...');
        grid_test_result(k,:)=do_test_main( ap_coordinates, model_parameters, rp_coordinates, tp_coordinates );
    end
end
close(hwait);

%%
% step 6: clean data
gid=[0.1 0.2 0.5 1 1.25 2 2.5 5];
imax=size(grid_test_result,1);
grid_clean_result=cell(imax,6);
hwait=waitbar(0,'DATA CLEANING...');
for i=1:imax
    k=fix((i-1)/8)+1;
    attenuation_temp=grid_test_result{i,3}(1,1);
    sigma_temp=grid_test_result{i,3}(2,1);
    temp1=grid_test_result{i,6}{1,3};
    nn_rmse=get_rmse(temp1);
    temp2=grid_test_result{i,6}{1,5};
    prob_rmse=get_rmse(temp2);
    %result format:
    %gid sigma nn_error nn_rmse prob_error prob_rmse
    grid_clean_result(i,:)={gid(k) sigma_temp temp1 nn_rmse temp2 prob_rmse};
    waitbar(i/imax,hwait,'DATA CLEANING...');
end
close(hwait);

%%
save test_result_grid.mat grid_test_result grid_clean_result;
fprintf('%s\n','Sample grid test finished!');
