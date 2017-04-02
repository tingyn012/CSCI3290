function gIm = luminosity(im)

R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);

gIm = (0.21*R + 0.72*G + 0.07*B);
%Simshow(gIm);
end