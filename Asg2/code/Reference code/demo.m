
%%
Im = im2double(imread('6.png'));
% Im = im2double(imread('11.png'));
% Im = im2double(imread('23.png'));
% gIm = cprgb2gray(Im);
tic;
gIm = rtcprgb2gray(Im);
toc
figure, imshow(Im), figure, imshow(gIm);
