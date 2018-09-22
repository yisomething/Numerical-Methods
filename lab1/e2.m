% Sample script  that shows how to automate running problem solutions
close all;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a) Load an image using the imread command 
f1 = figure;
img = imread('hi.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b) Display original image in the first spot of a 2 x 3 a grid layout
%    Check the imshow and subplot commands.

subplot(2,3,1);
imshow(img);
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% c) Display a gray scale version of the image in position 2 of the grid.
%    help rgb2gray
subplot(2,3,2);
gray = rgb2gray(img);
imshow(gray);
pause();



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% d) Generate a new figure and ask user to manually select a region of the
%    image. Display the subimage in position 3 of the grid.
%    Hint--> getrect()

% Get user input on a newly dislayed image

% Make grid the current figure

% Display selected region. Note the last : which applies the cut
% over all 3 channels.

f2 = figure;
figure(f2);
imshow(img);
rect = getrect;
rect(1) = max(floor(rect(1)),1); %xmin
rect(2) = max(floor(rect(2)),1); %ymin
rect(3) = min(ceil(rect(1)+rect(3))); %xmax
rect(4) = min(ceil(rect(2)+rect(4))); %ymax
newImg = img(rect(2):rect(4),rect(1):rect(3),:);
image(newImg);
imwrite(newImg, 'hi2.jpg')
close();
figure(f1);
subplot(2,3,3);
imshow('hi2.jpg');

pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% e) Create a function J = luminance_change(I, option, value) such that:
%   * When given the option 'c', image I's contrast will be modified by
%     the given value. Simple multiplication will achieve this.
%   * When given the option 'b', image I's brightness will be modified by
%     the given value. Simple addition will achieve this.
%  
%   Showcase your function by filling positions 4 and 5 in the grid

% Contrast change

J1 = luminance_change(img,'c',2);
figure(f1);
subplot(2,3,4);
imshow(J1);
pause()

% Brightness change

J2 = luminance_change(img,'b',50);
figure(f1);
subplot(2,3,5);
imshow(J2);
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f) BONUS: Display a version of the image after it's been blurred using a
%    Gaussian filter. Hint: imgaussfilt()
blur = imgaussfilt(img, 10);
figure(f1);
subplot(2,3,6);
imshow(blur);
pause();
close();

function J = luminance_change(I, option, value)
    if option == 'c'
        J = I * value;
    elseif option == 'b'
        J = I + value;
    end
end

