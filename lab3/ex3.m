% taylor expansion I(u+du,v+dv) = I(u,v) + [Ix(u,v) Iy(u,v)][du dv]' + hot
% B is formed by [I, Ix, Iy]
% coefficients( Y ) are of the form [1 du dv]
close all;
clear;
f1 = figure();
load('immotion_basis.mat');
I = B(:,1);
Ix = B(:,2);
Iy = B(:,3);
clear Y;
Y(1,:) = ones(1,62);

% inserted t-values into the Y matrix of coefficients
% t = -3:0.2:3, size t equal 31
t = -3:0.2:3;

Y(2,:) = [t,zeros(1,31)];
Y(3,:) = [zeros(1,31),t];
du = Y(2,:);
dv = Y(3,:);
[~,y]=size(Y);
 for i = 1:y
     title('initial')
     imshow(reshape(I + [Ix Iy]*[du(i) dv(i)]',imsize));
     title('small shift ends');        
 end
pause();


%%%%%%%%%%%%%%%%%%%%%% Larger Y values %%%%%%%%%%%%%%%%%%%%%%%%%%%%
f2 = figure();
Y_larger=[ones(1,19);0 5:10 zeros(1,6) 5:10;0 zeros(1,6) 5:10 5:10];
I = B(:,1);
Ix = B(:,2);
Iy = B(:,3);
du = Y_larger(2,:);
dv = Y_larger(3,:);
[~,y]=size(Y_larger);
 for i = 1:y

     imshow(reshape(I + [Ix Iy]*[du(i) dv(i)]',imsize));
 end 
pause();
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% self picked image %%%%%%%%%%%%%%%%%%
f3 = figure();
I = imread('Kakashi.jpg');
% change my image into gray scale to do the math
I=double(rgb2gray(I))/255;
[Ix,Iy]=gradient(I);
imsize = size(I);
I = I(:);
Ix = Ix(:);
Iy = Iy(:);
clear Y;
Y(1,:) = ones(1,62);
Y(2,:) = [t,zeros(1,31)];
Y(3,:) = [zeros(1,31),t];
du = Y(2,:);
dv = Y(3,:);
[~,y]=size(Y);
 for i = 1:y
     imshow(reshape(I + [Ix Iy]*[du(i) dv(i)]',imsize));
     title('Kakashi shift'); 
 end
pause();
close all; 
   
