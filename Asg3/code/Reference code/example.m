texture = imread('yogurt.bmp');

figure;

imshow(texture);

figure;

outsize = size(texture)*3;
tilesize = 12;
overlapsize = 3;
isdebug = 0;

t2 = synthesize(texture,   outsize , tilesize, overlapsize,isdebug);

imshow(uint8(t2))