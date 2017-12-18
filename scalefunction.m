function mean_value = scalefunction( m_img )

data=rgb2gray(m_img);
fun = @(block_struct) dct2(block_struct.data);
B = blockproc(data,[8 8],fun);
vbr=uint8(255 * mat2gray(B));
val=vbr(1:8:end);
mean_value=mean(val);
end

