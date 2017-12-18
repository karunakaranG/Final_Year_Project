function ima=prepocess(image)

[row, col] = size(image);

for kk = 1 : row
    for yy = 1 : col
        if (image(kk,yy)<4)
           ima(kk,yy)=0;
        else
            ima(kk,yy)=image(kk,yy);
        end
    end
end

end