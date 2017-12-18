function [final] = Embedded( pepper,I,finger,patient )
%[ROI, rect] = imcrop(I);
%RONI=I;

scale_value=(scalefunction(pepper)/100);
[IC1,IC2,IC3,coeff,mu,score]=principal_ca(pepper);

%IC2 has exponential values that was converted to 0---255 range in im1
%image8Bit = uint8(255 * mat2gray(IC2));
%figure,imshow(IC2,[min(IC2(:)) max(IC2(:))]);
%figure,imshow(IC3,[]);
%figure,imshow(IC4,[]);

[IC1_LL1,IC1_LH1,IC1_HL1,IC1_HH1]=dwt2(im2double(IC1),'haar');
[IC2_LL1,IC2_LH1,IC2_HL1,IC2_HH1]=dwt2(im2double(IC2),'haar');
[IC3_LL1,IC3_LH1,IC3_HL1,IC3_HH1]=dwt2(im2double(IC3),'haar');


medical=I*(scale_value/10);
fing=finger*(scale_value/10);
patie=patient*(scale_value/10);

medi=imresize(medical,[size(IC1_LL1,1) size(IC1_LL1,2)]);
finge=imresize(fing,[size(IC1_LL1,1) size(IC1_LL1,2)]);
pat=imresize(patie,[size(IC1_LL1,1) size(IC1_LL1,2)]);

medical_embedded=IC1_HH1+medi;
finger_embedded=IC2_HH1+finge;
patient_embedded=IC3_HH1+pat;

idwt1_result=idwt2(IC1_LL1,IC1_LH1,IC1_HL1,medical_embedded,'haar');
idwt2_result=idwt2(IC2_LL1,IC2_LH1,IC2_HL1,finger_embedded,'haar');
idwt3_result=idwt2(IC3_LL1,IC3_LH1,IC3_HL1,patient_embedded,'haar');


final_image=pca_reconstruction(idwt1_result,idwt2_result,idwt3_result,coeff,mu);

final_val=uint8(255 * mat2gray(final_image));
final=reshape(final_val,size(pepper,1),size(pepper,2),3);



end

