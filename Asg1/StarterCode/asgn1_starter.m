%% CSCI 3290: Assignment 1 Starter Code

% Input glass plate image
 imgname = '01040v.jpg';
% imgname = '01087u.tif';
fullimg = imread(imgname);

% Convert to double matrix
fullimg = im2double(fullimg);

% Calculate the height of each part (about 1/3 of total)
ImgH = floor(size(fullimg,1)/3);

% Separate B-G-R channels
B = fullimg(1:ImgH,:);
G = fullimg(ImgH+1:ImgH*2,:);
R = fullimg(ImgH*2+1:ImgH*3,:);

%% Align the images
% Functions that might be useful:"circshift", "sum", and "imresize"

tic;   % The Timer starts. To Evalute algorithms' efficiency.

% Write your codes here. 
% Write your function of alignSingle and alignMulti

 aG = alignSingle(G,B);
 aR = alignSingle(R,B);
% aG = alignMulti(G,B);
% aR = alignMulti(R,B);


% fid = 1;
% fprintf(fid,'%d\n',test);

toc;   % The Timer stops and displays time elapsed.

%% Output Results

% Create a color image (3D array): "cat" command
% For your own code, "G","R" shoule be replaced to "aG","aR"
colorImg = cat(3,aR,aG,B);

% Show the resulting image: "imshow" command
imshow(colorImg);

% Save result image to File
imwrite(colorImg,['result-' imgname]);

