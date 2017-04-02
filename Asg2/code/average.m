function gIm = average(im)

B = im(:,:,1);
G = im(:,:,2);
R = im(:,:,3);

gIm = (B + G + R) / 3;
% imshow(gIm);
end