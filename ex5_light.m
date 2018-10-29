clear all;
load('light_pca.mat');

%%%%%%%%%%%%%%%%%% initial %%%%%%%%%%%%%%%%%%%%%
for c = 1:size(Y,2)
    Ic = renderim(Y(:,c),B,imsize);
    imshow(Ic),title('Initial');
    drawnow
end
pause();
close all;
%%%%%%%%%%%%%%%%%%% linear interp %%%%%%%%%%%%%%%%%%%%%%%
% 4-times X_new and Y_new
X_new = linspace(-120,120,52);
[n,~] = size(Y);
Y_new = zeros(n,size(X_new,2));
for i = 1:n
    Y_tem = Y(i,:);
    Y_new(i,:) = linear_interp(X,Y_tem,X_new);
end

for c = 1 : size(Y_new,2)
    Ic = renderim(Y_new(:,c), B,imsize);
    imshow(Ic),title('linear interpolation');
    drawnow
end
for i=1:n
    figure(i)
    plot(X,Y(i,:),'*')
    hold on
    plot(X_new,Y_new(i,:))
    hold off
end
pause();
close all;
%%%%%%%%%%%%%%%%% poly interp degree = 6 %%%%%%%%%%%%%%%%%%%%
% 4-times X_new and Y_new
X_new = linspace(-120,120,52);
[n,~] = size(Y);
Y_new = zeros(n,size(X_new,2));
for i = 1:n
    Y_tem = Y(i,:);
    Y_new(i,:) = polynomial_interp(X,Y_tem,X_new,6);
end


for c = 1 : size(Y_new,2)
    Ic = renderim(Y_new(:,c), B,imsize);
    imshow(Ic),title('poly interpolation');
    drawnow
end

for i=1:n
    figure(i)
    plot(X,Y(i,:),'*')
    hold on
    plot(X_new,Y_new(i,:))
    hold off
end
pause();
close all;
%%%%%%%%%%%%%%%%% (5)vary the number of eigen-images %%%%%%%%%%%%%%%%%%%%

col1=B(:,1:3);
col2=B(:,5:7);
col3=B(:,9:11);
col4=B(:,13:14);
B=[col1 col2 col3 col4];
for c = 1:size(Y,2)
    Ic = renderim(Y(:,c),B,imsize);
    imshow(Ic),title('vary the number of eigen-images');
    drawnow
end

pause();
close all;

%%%%%%%%%%%%%%%%%% (6) verify method %%%%%%%%%%%%%%%%%%%%%%
% pick one t-values, we omit Y(:,2)
% so we use Y(:,1) and Y(:,3) to interpolte new Y(:,2)
% using degree = 1 interpolating

load('light_pca.mat');

X_omit = [-120, -70];
Y_omit = [Y(:,1), Y(:,3)];
X_omit_new = [-120,-95,-70];

Y_colum_new =zeros(1,14);
for i = 1:14
    Y_omit_new = polynomial_interp(X_omit,Y_omit(i,:),X_omit_new,1);
    Y_colum_new(i) = Y_omit_new(2);
end

im_new = reshape(B * Y_colum_new', imsize);
im_initial = reshape(B * Y(:,2), imsize);
subplot(1,2,1),imshow(im_new), title('new');
subplot(1,2,2),imshow(im_initial), title('initial');
error = norm(im_new - im_initial);
disp(error);

pause();
close all;