function ia=comparision(lungimage,filtimage)

[row, col] = size(lungimage);
%ia=zeros(row,col);
filterimage=filtimage;
%imtool(filterimage);
%imtool(lungimage);
%figure,imshow(filterimage);
for kk = 1 : row
    for yy = 1 : col
        if ((lungimage(kk,yy)>200)&&(abs((lungimage(kk,yy)-filterimage(kk,yy)))>100))
           ia(kk,yy)=filterimage(kk,yy);
        else
            ia(kk,yy)=lungimage(kk,yy);
        end
    end
end
%imtool(ia);
end
