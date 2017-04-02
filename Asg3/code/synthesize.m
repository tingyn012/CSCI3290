function [imout] = synthesize(inputImg, tarImg, szPatch, szOverlap, ifdebug)

inputImg = double(inputImg);
tarImg = double(tarImg);
sizeout_s = size(tarImg);
 
imout = zeros(sizeout_s);
sizein = size(inputImg);

temp = ones([szOverlap szPatch]);
errtop = xcorr2(inputImg.^2, temp);
temp = ones([szPatch szOverlap]);
errside = xcorr2(inputImg.^2, temp);
temp = ones([szPatch-szOverlap szOverlap]);
errsidesmall = xcorr2(inputImg.^2, temp);

imout_clone = zeros(sizeout_s);

h = imshow(uint8(imout));

for i=1:szPatch-szOverlap:sizeout_s(1)-szPatch+1,
  for j=1:szPatch-szOverlap:sizeout_s(2)-szPatch+1,

    if (i > 1) & (j > 1),
    % extract top shared region
      shared = imout(i:i+szOverlap-1,j:j+szPatch-1);
      err = errtop - 2 * xcorr2(inputImg, shared) + sum(shared(:).^2);

      % trim invalid data at edges, and off bottom where we don't want
      % tiles to go over the edge
      err = err(szOverlap:end-szPatch+1,szPatch:end-szPatch+1);
      
      % extract left shared region, skipping bit already checked
      shared = imout(i+szOverlap:i+szPatch-1,j:j+szOverlap-1);
      err2 = errsidesmall - 2 * xcorr2(inputImg, shared) + sum(shared(:).^2);
      
      
      % sum(shared(:).^2); trim invalid data at edges, and where we
      % don't want tiles to go over the edges
      err = err + err2(szPatch:end-szPatch+szOverlap+1, szOverlap:end-szPatch+1);
      
      [ibest, jbest] = find(err <= 1.1*1.1*min(err(:)));
      c = ceil(rand * length(ibest));
      pos = [ibest(c) jbest(c)];

    elseif i > 1
      shared = imout(i:i+szOverlap-1,j:j+szPatch-1);
      err = errtop - 2 * xcorr2(inputImg, shared)+ sum(shared(:).^2);
      
%      if((i+sizein(1)-1) < sizeout_s)
%         errTarget = xcorr2(tarImg(i:(i+sizein(1)-1),j:(j+sizein(2)-1)) , shared);
%      end
          
      % trim invalid data at edges
      err = err(szOverlap:end-szPatch+1,szPatch:end-szPatch+1);

      [ibest, jbest] = find(err <= 1.1*1.1*min(err(:)));
      c = ceil(rand * length(ibest));
      pos = [ibest(c) jbest(c)];
    elseif j > 1
      shared = imout(i:i+szPatch-1,j:j+szOverlap-1);
      err = errside - 2 * xcorr2(inputImg, shared)+ sum(shared(:).^2);
 
 %     if((j+sizein(2)-1) < sizeout_s)
 %     errTarget = xcorr2(tarImg(i:(i+sizein(1)-1),j:(j+sizein(2)-1)) , shared);
 %     end
            
      % trim invalid data at edges
      err = err(szPatch:end-szPatch+1,szOverlap:end-szPatch+1);

      [ibest, jbest] = find(err <= 1.1*1.1*min(err(:)));
      c = ceil(rand * length(ibest));
      pos = [ibest(c) jbest(c)];
    else
      pos = ceil(rand([1 2]) .* (sizein-szPatch+1));
    end

       %% For Synthesis result, use below line
   % imout(i:i+szPatch-1,j:j+szPatch-1) = inputImg(pos(1):pos(1)+szPatch-1,pos(2):pos(2)+szPatch-1);
      %% Texture Transfer result
   imout(i:i+szPatch-1,j:j+szPatch-1) = tarImg(i:i+szPatch-1,j:j+szPatch-1);
   imout_clone(i:i+szPatch-1,j:j+szPatch-1) = inputImg(pos(1):pos(1)+szPatch-1,pos(2):pos(2)+szPatch-1);
    if ifdebug~=0
    set(h,'CData',uint8(imout_clone));
    drawnow;
    end
    
  end
end

imout = imout_clone;

end