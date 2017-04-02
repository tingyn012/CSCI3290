viedo = VideoReader('bigbang2.mp4');
[img,map,alpha] = imread('smilelogo2.png');
% [img2,map,alpha2] = imread('r2.png');
% [img3,map,alpha3] = imread('r3.png');
% [img4,map,alpha4] = imread('r4.png');
% [img5,map,alpha5] = imread('r5.png');
% [img6,map,alpha6] = imread('r6.png');
% [img7,map,alpha7] = imread('r7.png');
% [img8,map,alpha8] = imread('r8.png');

vidWidth = viedo.Width;
vidHeight = viedo.Height;


[imgHeight,imgWidth,thash] = size(img);

mov = struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),'colormap',[]);

% Read in all video frames.
vidFrames = read(viedo);

% Get the number of frames.
numFrames = get(viedo, 'NumberOfFrames');

position =  [88 vidHeight-62]; % [x y]
value1 = ['so ***** with two slits in it and either slit is observed,'];
value2 = ['it will not go through both slits.'];
value3 = ['If it¡«s unobserved, it will.'];
value4 = ['However,if it¡«s observed after it¡«s left the plane but before it hits its target,'];
value5 = ['it will not have gone though both slits.'];
value6 = ['Agreed. What¡«s your point?'];
value7 = ['There¡«s no point. I just think it¡«s a good idea for a t-shirt.'];
value8 = ['Excuse me.'];
value9 = ['Hang on.'];
value10 = ['Uh,one across is "aegean."'];


for k = 1 : numFrames
    mov(k).cdata = vidFrames(:,:,:,k);
    
    for i = 1:imgHeight
        for j = 0:imgWidth-1
        array = alpha(i,imgWidth-j);
        if (array == 0)
        else
        mov(k).cdata(100+i,vidWidth-j-150,:) = img(i,imgWidth-j,:);
        end
        end
    end
    
%     if(mod(k,8) == 2)
%     for i = 1:imgHeight
%         for j = 0:imgWidth-1
%         array = alpha2(i,imgWidth-j);
%         if (array == 0)
%         else
%         mov(k).cdata(45+i,vidWidth-j-45,:) = img2(i,imgWidth-j,:);
%         end
%         end
%     end
%     end 
%     if(mod(k,8) == 3)
%     for i = 1:imgHeight
%         for j = 0:imgWidth-1
%         array = alpha3(i,imgWidth-j);
%         if (array == 0)
%         else
%         mov(k).cdata(45+i,vidWidth-j-45,:) = img3(i,imgWidth-j,:);
%         end
%         end
%     end
%     end    
%     if(mod(k,8) == 4)
%     for i = 1:imgHeight
%         for j = 0:imgWidth-1
%         array = alpha4(i,imgWidth-j);
%         if (array == 0)
%         else
%         mov(k).cdata(45+i,vidWidth-j-45,:) = img4(i,imgWidth-j,:);
%         end
%         end
%     end
%     end  
%     if(mod(k,8) == 5)
%     for i = 1:imgHeight
%         for j = 0:imgWidth-1
%         array = alpha5(i,imgWidth-j);
%         if (array == 0)
%         else
%         mov(k).cdata(45+i,vidWidth-j-45,:) = img5(i,imgWidth-j,:);
%         end
%         end
%     end
%     end    
%     if(mod(k,8) == 6)
%     for i = 1:imgHeight
%         for j = 0:imgWidth-1
%         array = alpha6(i,imgWidth-j);
%         if (array == 0)
%         else
%         mov(k).cdata(45+i,vidWidth-j-45,:) = img6(i,imgWidth-j,:);
%         end
%         end
%     end
%     end    
%     if(mod(k,8) == 7)
%     for i = 1:imgHeight
%         for j = 0:imgWidth-1
%         array = alpha7(i,imgWidth-j);
%         if (array == 0)
%         else
%         mov(k).cdata(45+i,vidWidth-j-45,:) = img7(i,imgWidth-j,:);
%         end
%         end
%     end
%     end    
%     if(mod(k,8) == 0)
%     for i = 1:imgHeight
%         for j = 0:imgWidth-1
%         array = alpha8(i,imgWidth-j);
%         if (array == 0)
%         else
%         mov(k).cdata(45+i,vidWidth-j-45,:) = img8(i,imgWidth-j,:);
%         end
%         end
%     end
%     end    
    
%     if(k >= 18 && k <= 87)
%      mov(k).cdata = insertText(mov(k).cdata, position, value1, 'AnchorPoint', 'LeftBottom' , 'FontSize' , 16);
%     end
%     if(k > 87 && k <= 145)
%      mov(k).cdata = insertText(mov(k).cdata, position, value2, 'AnchorPoint', 'LeftBottom' , 'FontSize' , 16);
%     end
%     if(k > 145 && k <= 174)
%      mov(k).cdata = insertText(mov(k).cdata, position, value3, 'AnchorPoint', 'LeftBottom' , 'FontSize' , 16);
%     end
%     if(k > 174 && k <= 252)
%      mov(k).cdata = insertText(mov(k).cdata, position, value4, 'AnchorPoint', 'LeftBottom' , 'FontSize' , 14);
%     end
%     if(k > 252 && k <= 294)
%      mov(k).cdata = insertText(mov(k).cdata, position, value5, 'AnchorPoint', 'LeftBottom' , 'FontSize' , 16);
%     end
%     if(k > 294 && k <= 346)
%      mov(k).cdata = insertText(mov(k).cdata, position, value6, 'AnchorPoint', 'LeftBottom' , 'FontSize' , 16);
%     end
%     if(k > 346 && k <= 403)
%      mov(k).cdata = insertText(mov(k).cdata, position, value7, 'AnchorPoint', 'LeftBottom' , 'FontSize' , 16);
%     end
%     if(k > 546 && k <= 570)
%      mov(k).cdata = insertText(mov(k).cdata, position, value8, 'AnchorPoint', 'LeftBottom' , 'FontSize' , 16);
%     end
%     if(k > 570 && k <= 616)
%      mov(k).cdata = insertText(mov(k).cdata, position, value9, 'AnchorPoint', 'LeftBottom' , 'FontSize' , 16);
%     end
%     if(k > 678 && k <= 723)
%      mov(k).cdata = insertText(mov(k).cdata, position, value10, 'AnchorPoint', 'LeftBottom' , 'FontSize' , 16);
%     end
    
    mov(k).colormap = [];
end

hf = figure;
set(hf,'position',[150 150 vidWidth vidHeight]);

movie(hf,mov,1,viedo.FrameRate);

writerObj = VideoWriter('result_right2.avi');
writerObj.FrameRate = viedo.FrameRate;
open(writerObj);
writeVideo(writerObj,mov);
close(writerObj);