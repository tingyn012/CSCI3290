global distinctive_number pixel_pairs;
Im = im2double(imread('C:/Users/LH532M15B/Desktop/code/testimages/6.png'));

% Part 1: Basic Decolorization Algorithm
tic;
% gIm = rtcprgb2gray(Im); %rtcprgb2gray.m
 gIm = cprgb2gray(Im); %cprgb2gray.m
% gIm = lightness(Im); %lightness.m
% gIm = average(Im); %average.m
% gIm = luminosity(Im); %luminosity.m
toc

% Part 2: Decolorization Evaluation: Color Contrast Preserving Ratio (CCPR)
ccprRes = 0;
for tau = 1:15
    ccpr = CCPR(gIm, Im, tau);
    ccprRes = ccprRes + ccpr;
end

fprintf('CCPR is %f', ccprRes/15);
figure, imshow(Im), figure, imshow(gIm);
