function gIm = cprgb2gray(im)
% input 'im' is a color image
% output gIm is the resulting grayscale image

% Step 1: Convert the input to LAB space
labTransformation = makecform('srgb2lab');
labI = applycform(im,labTransformation);

%seperate l,a,b
l = labI(:,:,1);
a = labI(:,:,2);
b = labI(:,:,3);

%figure, imshow(l) , title('l');
%figure, imshow(a) , title('a');
%figure, imshow(b) , title('b');

% Step 2: Construct delta_xy for each neighboring pixels

    % Opening neighbor around l,a,b.
    l_x_neighbor = circshift(l,[0 1]);
    a_x_neighbor = circshift(a,[0 1]);
    b_x_neighbor = circshift(b,[0 1]);
    
    l_y_neighbor = circshift(l,1);
    a_y_neighbor = circshift(a,1);
    b_y_neighbor = circshift(b,1);

diff_l_x = l - l_x_neighbor;
Xsign = sign(l - l_x_neighbor);
diff_a_x = a - a_x_neighbor;
diff_b_x = b - b_x_neighbor;

delta_x = ((diff_l_x).^2+(diff_a_x).^2+(diff_a_x).^2).^0.5 .* Xsign;

diff_l_y = l - l_y_neighbor;
Ysign = sign(l - l_y_neighbor);
diff_a_y = a - a_y_neighbor;
diff_b_y = b - b_y_neighbor;

delta_y = ((diff_l_y).^2+(diff_a_y).^2+(diff_a_y).^2).^0.5 .* Ysign;

delta_xy = [delta_y(:);delta_x(:)];

% Step 3: Constructing A and Delta

[m,n] = size(l);

D = sparse(1:m*n,1:m*n,1*ones(1,m*n),2*m*n,m*n);
E = sparse(1:m*n-1,2:m*n,-1*ones(1,m*n-1),2*m*n,m*n);
F = sparse(m*n+1:2*m*n,1:m*n,1*ones(1,m*n),2*m*n,m*n);
G = sparse(m*n+1:2*m*n-m,m+1:m*n,-1*ones(1,m*n-m),2*m*n,m*n);
H = sparse(2*m*n-m+1:2*m*n,m*n-2*m+1:m*n-m,-1*ones(1,m),2*m*n,m*n);


A = D+E+F+G+H;


% Step 4: Solve the objective function to get G

G = A \ delta_xy ; 

gIm = reshape(G,[m,n])*-1;
% imshow(gIm);

% Normalization
gIm = (gIm - min(gIm(:)))/ (max(gIm(:)) - min(gIm(:)));
% imshow(gIm);

end

