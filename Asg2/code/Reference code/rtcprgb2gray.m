%   Distribution code Version 1.0 -- 08/10/2012 
%   %
%   The Code is created based on the method described in the following paper 
%   [1] "Realtime Contrast Preserving Decolorization", Cewu Lu, Li Xu, Jiaya Jia,
%   ACM SIGGRAPH ASIA 2012 Technical Berief, 2012
%
%   Copyright 2011, The Chinese University of Hong Kong.
%  
%   The code and the algorithm are for non-comercial use only.
%   webpage: http://www.cse.cuhk.edu.hk/~leojia/projects/color2gray/


function  img  = rtcprgb2gray(im)
 
%%  Proprocessing 
[n,m,ch] = size(im); 
sigma = 0.05;
W = wei();
 
 
%%  Global and Local Contrast Computing
ims = imresize(im, round(64/sqrt(n*m)*[n,m]),'nearest');
R = ims(:,:,1);G = ims(:,:,2);B = ims(:,:,3);
imV = [R(:),G(:),B(:)];
defaultStream = RandStream.getDefaultStream; savedState = defaultStream.State;
t1 = randperm(size(imV,1));
Pg = [imV - imV(t1,:)];

ims = imresize(ims, 0.5 ,'nearest');
Rx = ims(:,1:end-1,1) - ims(:,2:end,1);
Gx = ims(:,1:end-1,2) - ims(:,2:end,2);
Bx = ims(:,1:end-1,3) - ims(:,2:end,3);

Ry = ims(1:end-1,:,1) - ims(2:end,:,1);
Gy = ims(1:end-1,:,2) - ims(2:end,:,2);
By = ims(1:end-1,:,3) - ims(2:end,:,3);
Pl = [[Rx(:),Gx(:),Bx(:)];[Ry(:),Gy(:),By(:)]];

P = [Pg;Pl ]; 
 
det = sqrt(sum(P.^2,2))/1.41  ;
 
P( (det < 0.05),:) = []; det( (det < 0.05)) = [];
detM =  repmat(det,[1,size(W,1)]); L = P*W'; 
 
%% Energy optimization
 
U = log(exp(- (L + detM ).^2/sigma.^2) + exp(- (L- detM).^2/sigma.^2));
Es = mean(U); 
 
  
 
%% Output
[NULLval,bw] = max(Es); 
img = imlincomb(W(bw,1),im(:,:,1) , W(bw,2),im(:,:,2) ,  W(bw,3),im(:,:,3));
 
end

function W = wei()
W = [    0         0    1.0000
         0    0.1000    0.9000
         0    0.2000    0.8000
         0    0.3000    0.7000
         0    0.4000    0.6000
         0    0.5000    0.5000
         0    0.6000    0.4000
         0    0.7000    0.3000
         0    0.8000    0.2000
         0    0.9000    0.1000
         0    1.0000         0
    0.1000         0    0.9000
    0.1000    0.1000    0.8000
    0.1000    0.2000    0.7000
    0.1000    0.3000    0.6000
    0.1000    0.4000    0.5000
    0.1000    0.5000    0.4000
    0.1000    0.6000    0.3000
    0.1000    0.7000    0.2000
    0.1000    0.8000    0.1000
    0.1000    0.9000         0
    0.2000         0    0.8000
    0.2000    0.1000    0.7000
    0.2000    0.2000    0.6000
    0.2000    0.3000    0.5000
    0.2000    0.4000    0.4000
    0.2000    0.5000    0.3000
    0.2000    0.6000    0.2000
    0.2000    0.7000    0.1000
    0.2000    0.8000         0
    0.3000         0    0.7000
    0.3000    0.1000    0.6000
    0.3000    0.2000    0.5000
    0.3000    0.3000    0.4000
    0.3000    0.4000    0.3000
    0.3000    0.5000    0.2000
    0.3000    0.6000    0.1000
    0.3000    0.7000    0.0000
    0.4000         0    0.6000
    0.4000    0.1000    0.5000
    0.4000    0.2000    0.4000
    0.4000    0.3000    0.3000
    0.4000    0.4000    0.2000
    0.4000    0.5000    0.1000
    0.4000    0.6000    0.0000
    0.5000         0    0.5000
    0.5000    0.1000    0.4000
    0.5000    0.2000    0.3000
    0.5000    0.3000    0.2000
    0.5000    0.4000    0.1000
    0.5000    0.5000         0
    0.6000         0    0.4000
    0.6000    0.1000    0.3000
    0.6000    0.2000    0.2000
    0.6000    0.3000    0.1000
    0.6000    0.4000    0.0000
    0.7000         0    0.3000
    0.7000    0.1000    0.2000
    0.7000    0.2000    0.1000
    0.7000    0.3000    0.0000
    0.8000         0    0.2000
    0.8000    0.1000    0.1000
    0.8000    0.2000    0.0000
    0.9000         0    0.1000
    0.9000    0.1000    0.0000
    1.0000         0         0];
end 