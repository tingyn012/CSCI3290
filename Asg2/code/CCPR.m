function ccrpRe = CCPR(imGray, imColor, THR)
global distinctive_number pixel_pairs;
    [m,n] = size(imGray);
    
    % Step 1: Convert the input to LAB space
    labTransformation = makecform('srgb2lab');
    labI = applycform(imColor,labTransformation);

    %seperate l,a,b
    l = labI(:,:,1);
    a = labI(:,:,2);
    b = labI(:,:,3);
    
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

    delta_x = ((diff_l_x).^2+(diff_a_x).^2+(diff_b_x).^2).^0.5;

    diff_l_y = l - l_y_neighbor;
    Ysign = sign(l - l_y_neighbor);
    diff_a_y = a - a_y_neighbor;
    diff_b_y = b - b_y_neighbor;

    delta_y = ((diff_l_y).^2+(diff_a_y).^2+(diff_b_y).^2).^0.5;

    delta_xy = [delta_y(:);delta_x(:)];
    
    T = zeros(size(delta_xy));
    for i = 1:length(delta_xy)
    if delta_xy(i)>THR
       T(i) = 1;
    else
       T(i) = 0;
    end
    end
    T = reshape(T,[2*m,n]);

    imGray = imGray *100;
    imGray_x_neighbor = circshift(imGray,[0 1]);
    temp_x = abs(imGray_x_neighbor - imGray);
    imGray_y_neighbor = circshift(imGray,1);
    temp_y = abs(imGray_y_neighbor - imGray);
    temp_xy = [temp_y(:);temp_x(:)];
    
    T_G = zeros(size(temp_xy));
    for i = 1:length(temp_xy)
        if temp_xy(i)>THR
            T_G(i) = 1;
        else
            T_G(i) = 0;
        end
    end
    T_G = reshape(T_G,[2*m,n]);
    
    T_G = T + T_G;
    distinctive_number = numel(T_G, T_G > 1);
    
    pixel_pairs = numel(T, T > 0);
    
    ccrpRe = distinctive_number / pixel_pairs;
end