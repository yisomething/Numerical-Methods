clear all;
load('obj_pca.mat');



%%%%%%%%%%%%%%%%%%%% initial %%%%%%%%%%%%%%%%%%
for c = 1:size(Y,2)
    Ic = renderim(Y(:,c),B,imsize);
    imshow(Ic),title('Initial');
    drawnow
end

pause();
close all;

%%%%%%%%%%%%%%%%%%%% linear interp %%%%%%%%%%%%%%%%%%%%

X_new = linspace(0,355,288);
[n,~] = size(Y);
Y_new = zeros(n,size(X_new,2));

for i = 1:n
    Y_new(i,:) = linear_interp(X,Y(i,:),X_new);
end

for c = 1:size(Y_new,2)
    Ic = renderim(Y_new(:,c),B,imsize);
    imshow(Ic),title('linear interpolation');
    drawnow
end
close all;
for i=1:n
    figure(i)
    plot(X,Y(i,:),'*')
    hold on
    plot(X_new,Y_new(i,:))
    hold off
end
pause();
close all;

%%%%%%%%%%%%%%%%%%%% poly interp %%%%%%%%%%%%%%%%%%%%
X_new = linspace(0,355,288);
[n,~] = size(Y);
Y_new = zeros(n,size(X_new,2));

for i = 1:n
    Y_new(i,:) = polynomial_interp(X,Y(i,:),X_new,6);
end

for c = 1:size(Y_new,2)
    Ic = renderim(Y_new(:,c),B,imsize);
    imshow(Ic),title('poly interpolation');
    drawnow
end
close all;
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
col1=B(:,1:10);
col2=B(:,20:30);
col3=B(:,40:50);
col4=B(:,60:70);
B =[col1 col2 col3 col4];
for c = 1:size(Y,2)
    Ic = renderim(Y(:,c),B,imsize);
    imshow(Ic),title('vary the number of eigen-images');
    drawnow
end

pause();
close all;