function [ Ipc1,Ipc2,Ipc3,coeff,mu,score ] = principal_ca( imag_e )

I = im2double(imag_e);
X = reshape(I,size(I,1)*size(I,2),3);
[coeff,score,latent,tsquared,explained,mu] = pca(X);
Itransformed = X*coeff;
%z=x*v;

Ipc1 = reshape(Itransformed(:,1),size(I,1),size(I,2));
Ipc2 = reshape(Itransformed(:,2),size(I,1),size(I,2));
Ipc3 = reshape(Itransformed(:,3),size(I,1),size(I,2));

end

