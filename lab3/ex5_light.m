%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Light Part 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
close all; 
load('light_pca.mat');

%%%%%%%%%%%%%%%%%% re-generate the input images %%%%%%%%%%%%%%%%%%%%%%%%%%%
for c = 1:size(Y,2)
    Ic = renderim(Y(:,c),B,imsize);
    imshow(Ic)
    title('Original computational image');
    drawnow
end
pause();
close all;

%%%%%%%%%%%%%%%%%  polynomial interpolation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% linespace from 1st to last point, 4-times X_new and Y_new
% using polynomial_interp function from lab2, I choose degree 4 here
X_new = linspace(-120,120,52);
[n,~] = size(Y);
Y_new = zeros(n,size(X_new,2));
for i = 1:n
    Y_new(i,:) = polynomial_interp(X,Y(i,:),X_new,4);
    % plot fit 
    figure(i)
    plot(X,Y(i,:),'.')
    hold on
    plot(X_new,Y_new(i,:))
    hold off
end

for c = 1 : size(Y_new,2)
    Ic = renderim(Y_new(:,c), B,imsize);
    imshow(Ic),title('polynomial interpolation');
    drawnow
end
pause();
close all;

%%%%%%%%%%%%%%%%%%% piecewise linear interpolation %%%%%%%%%%%%%%%%%%%%%%%%
X_new = linspace(-120,120,52);
[n,~] = size(Y);
Y_new = zeros(n,size(X_new,2));
for i = 1:n
    Y_tem = Y(i,:);
    Y_new(i,:) = linear_interp(X,Y(i,:),X_new);
    % plot fit 
    figure(i)
    plot(X,Y(i,:),'.')
    hold on
    plot(X_new,Y_new(i,:)) 
    hold off
end

for c = 1 : size(Y_new,2)
    Ic = renderim(Y_new(:,c), B,imsize);
    imshow(Ic)
    title('linear interpolation');
    drawnow
end
pause();
close all;

%%%%%%%%%%%%%%%%% question5 part4 vary num eigen-img %%%%%%%%%%%%%%%%%%%%%%
B=[B(:,1:3) B(:,5:7) B(:,9:11) B(:,13:14)];
for c = 1:size(Y,2)
    Ic = renderim(Y(:,c),B,imsize);
    imshow(Ic)
    title('images after varying the number of eigen-images ');
    drawnow
end
pause();
close all;

%%%%%%%%%%%%%%%%%% verify correctness %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% leaving out some of the original data
load('light_pca.mat');
X_omit = [-120, -70];
Y_omit = [Y(:,1), Y(:,3)];
X_new = [-120,-95,-70];

Y_new =zeros(1,14);
for i = 1:14
    Y_omit_new = polynomial_interp(X_omit,Y_omit(i,:),X_new,1);
    Y_new(i) = Y_new(2);
end

img_approx = reshape(B * Y_new', imsize);
img = reshape(B * Y(:,2), imsize);
subplot(2,1,1),imshow(img_approx), title('approximation image');
subplot(2,1,2),imshow(img), title('original');
error = norm(img_approx - img);
disp(error);
pause();
close all;






