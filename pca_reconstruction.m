function  final_im= pca_reconstruction( I1,I2,I3,coef,mu)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%coe=pinv(coef);

%mux=mean(mu);
ii1=I1(:);
ii2=I2(:);
ii3=I3(:);
emde=[ii1,ii2,ii3];
final_im=(double(emde)*transpose(coef))+mean(mu);


%final_val=uint8(final_im);





























end

