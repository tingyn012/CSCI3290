function aimg = alignSingle(img,B)
% This function is to align img to B using single-scale algorithms
% Output is the aligned version of img
	[h,w] = size(B);
	% TODO: Write your codes for single-scale implementation
	% Initialize variables
    mirror = img; %copy of image
    img = imgradient(img);
    B = imgradient(B);
    Cimg = img;
    
    MaxScore = inf;
    countNumV = 1;
    countNumH = 1;   
	% Output aimg

    for j=1:h/8
        countNumV = 1;
        for i=1:w
        Score = sum((Cimg-B).^2);
            if(sum(Score)<MaxScore)
                MaxScore = sum(Score);
                findVMin = countNumV;
                findHMin = countNumH;
            end
        Cimg = circshift(img,i);
        countNumV = countNumV + 1;
        end
        Cimg = circshift(img,[j,-1]);
        countNumH = countNumH + 1;
    end
    aimg = circshift(mirror,findVMin);
    aimg = circshift(aimg,[findHMin,0]);
   end


