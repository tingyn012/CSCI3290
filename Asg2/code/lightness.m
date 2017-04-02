function gIm = lightness(im)

B = im(:,:,1);
G = im(:,:,2);
R = im(:,:,3);

max_gIm = max(B,G);
max_gIm = max(max_gIm,R);

min_gIm = min(B,G);
min_gIm = min(max_gIm,R);

gIm = (max_gIm + min_gIm) / 2;
% imshow(gIm);
end