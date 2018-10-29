%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Obj Part 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
load('obj_pca.mat');

%%%%%%%%%%%%%%%%%% re-generate the obj input images %%%%%%%%%%%%%%%%%%%%%%%
for c = 1:size(Y,2)
    Ic = renderim(Y(:,c),B,imsize);
    imshow(Ic),title('Original obj image');
    drawnow
end
pause();
close all;

%%%%%%%%%%%%%%%%%  obj polynomial interpolation %%%%%%%%%%%%%%%%%%%%%%%%%%%
X_new = linspace(0,355,288);
[n,~] = size(Y);
Y_new = zeros(n,size(X_new,2));

for i = 1:n
    Y_new(i,:) = polynomial_interp(X,Y(i,:),X_new,4);
end
% HERE I ONLY print first 20 figures 
% because they are too many and may result lag 
for i=1:20  
    figure(i)
    plot(X,Y(i,:),'.')
    hold on
    plot(X_new,Y_new(i,:))
    hold off
end

for c = 1:size(Y_new,2)
    Ic = renderim(Y_new(:,c),B,imsize);
    imshow(Ic)
    title('obj polynomial interpolation');
    drawnow
end
pause();
close all;

%%%%%%%%%%%%%%%%%%% piecewise obj linear interpolation %%%%%%%%%%%%%%%%%%%%
X_new = linspace(0,355,288);
[n,~] = size(Y);
Y_new = zeros(n,size(X_new,2));
for i = 1:n
    Y_new(i,:) = linear_interp(X,Y(i,:),X_new);
end
% HERE I ONLY print first 20 figures 
% because they are too many and may result lag 
for i=1:20
    figure(i)
    plot(X,Y(i,:),'.')
    hold on
    plot(X_new,Y_new(i,:))
    hold off
end

for c = 1:size(Y_new,2)
    Ic = renderim(Y_new(:,c),B,imsize);
    imshow(Ic)
    title('obj linear interpolation');
    drawnow
end
pause();
close all;

%%%%%%%%%%%%%%%%% question5 part4 vary num eigen-img %%%%%%%%%%%%%%%%%%%%%%
B =[B(:,1:10) B(:,20:30) B(:,40:50) B(:,60:70)];
for c = 1:size(Y,2)
    Ic = renderim(Y(:,c),B,imsize);
    imshow(Ic),title('images after varying the number of eigen-images');
    drawnow
end
pause();
close all;