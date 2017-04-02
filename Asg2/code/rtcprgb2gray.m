function  img = rtcprgb2gray(im)

[n,m] = size(im); 
sigma = 0.05;
W = wei();

Rx = circshift(im(:,:,1),[0 1]) - im(:,:,1);
Gx = circshift(im(:,:,2),[0 1]) - im(:,:,2);
Bx = circshift(im(:,:,3),[0 1]) - im(:,:,3);

Ry = circshift(im(:,:,1),1) - im(:,:,1);
Gy = circshift(im(:,:,2),1) - im(:,:,2);
By = circshift(im(:,:,3),1) - im(:,:,3);

P = [[Rx(:),Gx(:),Bx(:)];[Ry(:),Gy(:),By(:)]];

det = sqrt(sum(P.^2,2))/1.41  ;
 
detM =  repmat(det,[1,size(W,1)]);
L = P*W';
 
U = log(exp(- (L + detM ).^2/sigma.^2/2) + exp(- (L- detM).^2/sigma.^2/2));
Es = mean(U); 
  
[bestw_value,bestw] = max(Es); 
img = imlincomb(W(bestw,1),im(:,:,1) , W(bestw,2),im(:,:,2) ,  W(bestw,3),im(:,:,3));
 
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