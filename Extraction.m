function [ medicl,finger_print,patient_detail ] = Extraction( watermark_image,original_image)

%watermarked_image=uint8(255 * mat2gray(watermark_image));
%original_image=uint8(255 * mat2gray(origi_image));

scale_value=(scalefunction(original_image)/100);




[WIC1,WIC2,WIC3,Wcoeff,Wmu,Wscore]=principal_ca(watermark_image);
[OIC1,OIC2,OIC3,Ocoeff,Omu,Oscore]=principal_ca(original_image);

lvalue=(WIC1)-OIC1;
fvalue=(WIC2)-OIC2;
pvalue=(WIC3)-OIC3;
llval=lvalue*(scale_value*10);

[WWIC1_LL1,WWIC1_LH1,WWIC1_HL1,WWIC1_HH1]=dwt2(im2double(llval),'haar');
[WWIC2_LL1,WWIC2_LH1,WWIC2_HL1,WWIC2_HH1]=dwt2(im2double(fvalue*(scale_value*10)),'haar');
[WWIC3_LL1,WWIC3_LH1,WWIC3_HL1,WWIC3_HH1]=dwt2(im2double(pvalue*(scale_value*10)),'haar');



%medicl=WWIC1_HH1;
%finger_print=WWIC2_HH1;
%patient_detail=WWIC3_HH1;
medicl= uint8(255 * mat2gray(WWIC1_HH1));
finger_print= uint8(255 * mat2gray(WWIC2_HH1));
patient_detail= uint8(255 * mat2gray(WWIC3_HH1));


end

