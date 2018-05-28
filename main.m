% Run examples in the reference:
%   B.N. Li, C.K. Chui, S. Chang, S.H. Ong (2011) Integrating spatial fuzzy
%   clustering with level set methods for automated medical image
%   segmentation. Computers in Biology and Medicine 41(1) 1-10.
%--------------------------------------------------------------------------

%% reset data
clc; clear; close all;
%% open file image MRI
[img, canc]=imgetfile();

%% initialize
img=imread(img);
img=rgb2gray(img);
%ncluster=3;
ncluster=4;
%opt=1;
opt=2;

%% SFCM2D
MF = SFCM2D(img,ncluster);

figure
subplot(231); imshow(img,[])
for i=1:ncluster
    imgfi=reshape(MF(i,:,:),size(img,1),size(img,2));
    subplot(2,3,i+1); imshow(imgfi,[])
    title(['Index No: ' int2str(i)])
end

temp=1;
while temp
    nopt = input('Input the Index No that you are interested\n');
    if ~isempty(nopt), temp=0; end
end

close(gcf);

imgfcm=reshape(MF(nopt,:,:),size(img,1),size(img,2));

fuzzyLSM(img,imgfcm,.5);