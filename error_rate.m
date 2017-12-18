lung1=rgb2gray(imread('lung1.png'));
[row1,col1]=size(lung1);
patient1=rgb2gray(imread('patient1.png'));
[row2,col2]=size(patient1);
finger1=rgb2gray(imread('finger1.png'));
[row3,col3]=size(finger1);
lung2=imread('medical_extract.png');
[row4,col4]=size(lung2);
patient2=imread('patient_extract.png');
[row5,col5]=size(patient2);
finger2=imread('finger_extract.png');
[row6,col6]=size(finger2);

lu_err=sqrt(mean(mean((lung1-lung2).^2)));
pa_err=sqrt(mean(mean((patient1-patient2).^2)));
fi_err=sqrt(mean(mean((finger1-finger2).^2)));

lu_e=lu_err/row1*col1;
pa_e=pa_err/row2*col2;
fi_e=fi_err/row3*col3;

fprintf('lung_error %0.4f\n',lu_e);
fprintf('patient_error %0.4f\n',pa_e);
fprintf('finger_error %0.4f\n',fi_e);

lu_psnr =10*log10((255)^2/lu_e);
pa_psnr =10*log10((255)^2/pa_e);
fi_psnr =10*log10((255)^2/fi_e);


fprintf('PSNR lung_error %0.4f\n',lu_psnr);
fprintf('PSNR patient_error %0.4f\n',pa_psnr);
fprintf('PSNR finger_error %0.4f\n',fi_psnr);

