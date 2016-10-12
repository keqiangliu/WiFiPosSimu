clear;clc;
%%
% step 1: get ap coordinates
% ap geometry 
aps=cell(100,1);
% ap number is 5
% all on one edge
aps{1,1}=[0 0 3;0 1 3;0 2 3;0 3 3;0 4 3];
aps{2,1}=[0 0 3;0 1 3;0 2 3;0 3 3;0 9 3];
aps{3,1}=[0 0 3;0 1 3;0 5 3;0 7 3;0 9 3];
aps{4,1}=[0 0 3;0 2 3;0 4 3;0 6 3;0 8 3];
aps{5,1}=[0 0 3;0 1 3;0 4.5 3;0 8 3;0 9 3];
aps{6,1}=[0 3 3;0 4 3;0 5 3;0 6 3;0 7 3];
aps{7,1}=[0 0 3;0 1 3;0 2 3;0 8 3;0 9 3];
% change one ap
aps{8,1}=[0 0 3;0 1 3;0 2 3;0 3 3;4.5 9 3];
aps{9,1}=[0 0 3;0 2 3;0 4 3;0 8 3;4.5 9 3];
aps{10,1}=[0 4 3;0 5 3;0 6 3;0 7 3;4.5 9 3];
aps{11,1}=[0 0 3;0 1 3;0 8 3;0 8 3;4.5 9 3];
aps{12,1}=[0 0 3;0 1 3;0 2 3;0 3 3;9 9 3];
aps{13,1}=[0 0 3;0 2 3;0 4 3;0 8 3;9 9 3];
aps{14,1}=[0 4 3;0 5 3;0 6 3;0 7 3;9 9 3];
aps{15,1}=[0 0 3;0 1 3;0 8 3;0 8 3;9 9 3];
aps{16,1}=[0 0 3;0 1 3;0 2 3;0 3 3;9 4.5 3];
aps{17,1}=[0 0 3;0 2 3;0 4 3;0 8 3;9 4 3];
aps{18,1}=[0 4 3;0 5 3;0 6 3;0 7 3;9 4 3];
aps{19,1}=[0 0 3;0 1 3;0 8 3;0 8 3;9 4 3];
aps{20,1}=[0 0 3;0 1 3;0 2 3;0 3 3;9 0 3];
aps{21,1}=[0 0 3;0 2 3;0 4 3;0 8 3;9 0 3];
aps{22,1}=[0 4 3;0 5 3;0 6 3;0 7 3;9 0 3];
aps{23,1}=[0 0 3;0 1 3;0 8 3;0 8 3;9 0 3];
aps{24,1}=[0 0 3;0 1 3;0 2 3;0 3 3;4.5 0 3];
aps{25,1}=[0 0 3;0 2 3;0 4 3;0 8 3;4.5 0 3];
aps{26,1}=[0 4 3;0 5 3;0 6 3;0 7 3;4.5 0 3];
aps{27,1}=[0 0 3;0 1 3;0 8 3;0 8 3;4.5 0 3];
% change two aps
aps{28,1}=[0 0 3;0 1 3;0 2 3;4 9 3;5 9 3];
aps{29,1}=[0 0 3;0 5 3;0 9 3;4 9 3;5 9 3];
aps{30,1}=[0 4 3;0 5 3;0 6 3;4 9 3;5 9 3];
aps{31,1}=[0 0 3;0 1 3;0 2 3;8 9 3;9 9 3];
aps{32,1}=[0 0 3;0 5 3;0 9 3;8 9 3;9 9 3];
aps{33,1}=[0 4 3;0 5 3;0 6 3;8 9 3;9 9 3];
aps{34,1}=[0 0 3;0 1 3;0 2 3;9 5 3;9 4 3];
aps{35,1}=[0 0 3;0 5 3;0 9 3;9 5 3;9 4 3];
aps{36,1}=[0 4 3;0 5 3;0 6 3;9 5 3;9 4 3];
aps{37,1}=[0 0 3;0 1 3;0 2 3;9 0 3;9 1 3];
aps{38,1}=[0 0 3;0 5 3;0 9 3;9 0 3;5 9 3];
aps{39,1}=[0 4 3;0 5 3;0 6 3;9 0 3;5 9 3];
aps{40,1}=[0 0 3;0 1 3;0 2 3;4 0 3;5 0 3];
aps{41,1}=[0 0 3;0 5 3;0 9 3;4 0 3;5 0 3];
aps{42,1}=[0 4 3;0 5 3;0 6 3;4 0 3;5 0 3];
aps{43,1}=[0 0 3;0 1 3;0 2 3;4 9 3;9 9 3];
aps{44,1}=[0 0 3;0 5 3;0 9 3;4 9 3;9 9 3];
aps{45,1}=[0 4 3;0 5 3;0 6 3;4 9 3;9 9 3];
aps{46,1}=[0 0 3;0 1 3;0 2 3;9 9 3;9 5 3];
aps{47,1}=[0 0 3;0 5 3;0 9 3;9 9 3;9 5 3];
aps{48,1}=[0 4 3;0 5 3;0 6 3;9 9 3;9 5 3];
aps{49,1}=[0 0 3;0 1 3;0 2 3;9 5 3;9 0 3];
aps{50,1}=[0 0 3;0 5 3;0 9 3;9 5 3;9 0 3];
aps{51,1}=[0 4 3;0 5 3;0 6 3;9 5 3;9 0 3];
aps{52,1}=[0 0 3;0 1 3;0 2 3;5 0 3;9 0 3];
aps{53,1}=[0 0 3;0 5 3;0 9 3;5 0 3;9 0 3];
aps{54,1}=[0 4 3;0 5 3;0 6 3;5 0 3;9 0 3];
aps{55,1}=[0 0 3;0 1 3;0 2 3;4 9 3;9 4 3];
aps{56,1}=[0 0 3;0 5 3;0 9 3;4 9 3;9 4 3];
aps{57,1}=[0 4 3;0 5 3;0 6 3;4 9 3;9 4 3];
aps{58,1}=[0 0 3;0 1 3;0 2 3;9 9 3;9 0 3];
aps{59,1}=[0 0 3;0 5 3;0 9 3;9 9 3;9 0 3];
aps{60,1}=[0 4 3;0 5 3;0 6 3;9 9 3;9 0 3];
aps{61,1}=[0 0 3;0 1 3;0 2 3;4 0 3;9 4 3];
aps{62,1}=[0 0 3;0 5 3;0 9 3;4 0 3;9 4 3];
aps{63,1}=[0 4 3;0 5 3;0 6 3;4 0 3;9 4 3];
aps{64,1}=[0 0 3;0 1 3;0 2 3;4 9 3;9 0 3];
aps{65,1}=[0 0 3;0 5 3;0 9 3;4 9 3;9 0 3];
aps{66,1}=[0 4 3;0 5 3;0 6 3;4 9 3;9 0 3];
aps{67,1}=[0 0 3;0 1 3;0 2 3;4 9 3;9 4 3];
aps{68,1}=[0 0 3;0 5 3;0 9 3;4 9 3;9 4 3];
aps{69,1}=[0 4 3;0 5 3;0 6 3;4 9 3;9 4 3];
% change three aps
aps{70,1}=[0 0 3;0 1 3;0 9 3;4.5 9 3;9 9 3];
aps{71,1}=[0 0 3;0 5 3;0 9 3;4.5 9 3;9 9 3];
aps{72,1}=[0 0 3;0 9 3;0 9 3;4.5 9 3;9 9 3];
aps{73,1}=[0 0 3;0 1 3;4.5 9 3;9 9 3;9 4.5 3];
aps{74,1}=[0 0 3;0 5 3;4.5 9 3;9 9 3;9 4 3];
aps{75,1}=[0 0 3;0 9 3;4.5 9 3;9 9 3;9 4 3];
aps{76,1}=[0 0 3;0 1 3;9 9 3;9 4.5 3;9 0 3];
aps{77,1}=[0 0 3;0 5 3;9 9 3;9 4.5 3;9 0 3];
aps{78,1}=[0 0 3;0 9 3;9 9 3;9 4.5 3;9 0 3];
aps{79,1}=[0 0 3;0 1 3;9 4.5 3;9 0 3;4.5 0 3];
aps{80,1}=[0 0 3;0 5 3;9 4.5 3;9 0 3;9 9 3];
aps{81,1}=[0 0 3;0 9 3;9 4.5 3;9 0 3;9 9 3];
aps{82,1}=[0 0 3;0 1 3;0 9 3;9 9 3;4.5 0 3];
aps{83,1}=[0 0 3;0 5 3;0 9 3;9 9 3;4.5 0 3];
aps{84,1}=[0 0 3;0 9 3;0 9 3;9 9 3;4.5 0 3];
aps{85,1}=[0 0 3;0 1 3;4.5 9 3;9 4.5 3;4.5 0 3];
aps{86,1}=[0 0 3;0 5 3;4.5 9 3;9 4.5 3;4.5 0 3];
aps{87,1}=[0 0 3;0 9 3;4.5 9 3;9 4.5 3;4.5 0 3];
% change four aps
aps{88,1}=[0 0 3;0 9 3;4.5 9 3;9 9 3;9 4.5 3];
aps{89,1}=[0 4.5 3;0 9 3;4.5 9 3;9 9 3;9 4.5 3];
aps{90,1}=[0 0 3;0 9 3;4.5 9 3;9 4.5 3;9 0 3];
aps{91,1}=[0 4.5 3;0 9 3;4.5 9 3;9 4.5 3;9 0 3];
aps{92,1}=[0 0 3;4.5 9 3;9 9 3;9 4.5 3;9 0 3];
aps{93,1}=[0 4.5 3;4.5 9 3;9 9 3;9 4.5 3;9 0 3];
aps{94,1}=[0 0 3;4.5 9 3;9 9 3;4.5 0 3;9 0 3];
aps{95,1}=[0 4.5 3;4.5 9 3;9 9 3;4.5 0 3;9 0 3];
aps{96,1}=[0 0 3;9 9 3;9 4.5 3;9 0 3;4.5 0 3];
aps{97,1}=[0 4.5 3;9 9 3;9 4.5 3;9 0 3;4.5 0 3];
% change five aps
aps{98,1}=[0 0 3;0 9 3;9 9 3;9 0 3;4.5 4.5 3];
aps{99,1}=[0 6 3;4.5 9 3;9 6 3;7 0 3;2 0 3];
aps{100,1}=[0 0 3;0 9 3;9 9 3;9 0 3;4.5 0 3];

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
% step 5: test for ap shape
imax=size(noise_sigma,1);
jmax=size(aps,1);
apshape_test_result=cell(imax*jmax,6);
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
        apshape_test_result(k,:)=do_test_main( ap_coordinates, model_parameters, rp_coordinates, tp_coordinates );
    end
end
close(hwait);

%%
% step 6: clean data
imax=size(apshape_test_result,1);
apshape_clean_result=cell(imax,7);
hwait=waitbar(0,'DATA CLEANING...');
for i=1:imax
    ap_coors=apshape_test_result{i,2};
    [cd, cv]= get_cdcv(ap_coors);
%     attenuation_temp=apshape_test_result{i,3}(1,1);
    sigma_temp=apshape_test_result{i,3}(2,1);
    temp1=apshape_test_result{i,6}{1,3};
    nn_rmse=get_rmse(temp1);
    temp2=apshape_test_result{i,6}{1,5};
    prob_rmse=get_rmse(temp2);
    %result format:
    %ap_number attenuation sigma nn_error nn_rmse prob_error
    apshape_clean_result(i,1:7)={cd cv sigma_temp temp1 nn_rmse temp2 prob_rmse};
    waitbar(i/imax,hwait,'DATA CLEANING...');
end
close(hwait);
%%

save test_result_apshape.mat apshape_test_result apshape_clean_result;
clear;clc;
fprintf('%s\n','AP shape test finished!');










