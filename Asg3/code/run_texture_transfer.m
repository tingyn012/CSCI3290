clc;clear;close all;

targetImg = rgb2gray(imread('leonardo.jpg'));
inputImg = rgb2gray(imread('texture.jpg'));

alpha = 10;
szPatch = 10;
szOverlap = 4;
ifdebug = 1; % 1 = ON

tic;
 t2 = synthesize(inputImg,targetImg, szPatch, szOverlap, ifdebug);
% t2 = texture_transfer(inputImg, targetImg, alpha, szPatch, szOverlap, 1);
toc;

figure(1)
imshow(inputImg);
figure(2)
imshow(targetImg);
figure(3)
imshow(t2, [])
