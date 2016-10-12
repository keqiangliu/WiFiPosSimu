function [ cd,cv ] = get_cdcv( ap_cor )
%GETCDCV Summary of this function goes here
%   Detailed explanation goes here

map=mean(ap_cor,1);%map为ap质心坐标
cd_cor=map(1,1:2)-[4.5 4.5]; %field_centroid=[4.5 4.5];
cd=norm(cd_cor);

apn=size(ap_cor,1);
dis=zeros(apn,1);
for j=1:1:apn
    dd=ap_cor(j,1:2)-map(:,1:2);
    dis(j,1)=norm(dd);
end
cv=std(dis)*100/mean(dis);

end

