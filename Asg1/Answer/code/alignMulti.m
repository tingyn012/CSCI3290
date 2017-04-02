function aimg = alignMulti(img,B)
% This function is to align img to B using multi-scale algorithms
% Output is the aligned version of img
	[h,w] = size(B);
	% TODO: Write your codes for multi-scale implementation
	% TODO: Build Image Pyramid for img & B
	pyramid_scale = 0.5;
	pyramid_levels = 5; % choose your value
	gaussianf = fspecial('gaussian', [5,5], 1.5); % change if you need

    mirror = img; %copy of image
    
    B = imfilter(B,gaussianf);
    img = imfilter(img,gaussianf);

    img = imgradient(img);
    B = imgradient(B);    
    
	imgs = cell(pyramid_levels,1);
	imgs{1} = img;
	Bs = cell(pyramid_levels,1);
	Bs{1} = B;
	
	for ilevel = 2:1:pyramid_levels
		% write your code
		imgs{ilevel} = imresize(imgs{ilevel-1}, pyramid_scale);
		Bs{ilevel} = imresize(Bs{ilevel-1}, pyramid_scale);
	end
	
	% Scanning the top pyramid
    ilevel = pyramid_levels;
    Cimg = imgs{ilevel};
    [hs,ws] = size(imgs{ilevel});
    MaxScore = inf;
    countNumH = 1;
    for j=1:hs/4
       countNumV = 1;
        for i=1:ws
            Score = sum(sum((Cimg-Bs{ilevel}).^2));
            if(Score<MaxScore)
                MaxScore = Score;
                findVMin = countNumV;
                findHMin = countNumH;
            end
            Cimg = circshift(imgs{ilevel},i);
            countNumV = countNumV + 1;
        end
        Cimg = circshift(imgs{ilevel},[j,-1]);
        countNumH = countNumH + 1;
    end
    
    
    Cimg = circshift(imgs{ilevel},findVMin);
    Cimg = circshift(Cimg,[findHMin,-1]);
    
    
    for ilevel = pyramid_levels - 1:-1:1
        Cimg = circshift(imgs{ilevel},findVMin * 2);
        Cimg = circshift(Cimg,[findHMin * 2,-1]);
        MaxScore = inf;
        findVMin_s = findVMin * 2;
        findHMin_s = findHMin * 2;
        for i=--3:3 % Search 3*3 around larger image
           for j = -3*(pyramid_levels-ilevel) : 3*(pyramid_levels-ilevel)
              Cimg_s = circshift(Cimg,j);
              Score = sum(sum((Cimg_s-Bs{ilevel}).^2));
              if(Score<MaxScore)
                    MaxScore = Score;
                    findVMin = findVMin_s + j;
                    findHMin = findHMin_s + i;
              end
           end
           Cimg_s = circshift(Cimg,[i,-1]);
        end
    end
	
	% Output aimg
    aimg = circshift(mirror,findVMin);
    aimg = circshift(aimg,[findHMin,-1]);
end


