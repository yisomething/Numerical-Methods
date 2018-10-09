%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Tumor Contour %%%%%%%%%%%%%%%%%%%%%%%%%%%
I = imread('tumorContour.jpg');
[y,x] = find(I>250); % find the set of points on tumor


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Selected %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
II = imread('tumor.jpg');
subplot(1,1,1), imshow(II, 'InitialMagnification', 500);
[x_select, y_select] = ginput; % choose the points
hold off

x_select = x_select';  
y_select = y_select';

%%%%%%%%%%%%%%%%%%%%%%%%%% Regular Polynomials %%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%% Polynomial Degree = 1 %%%%%%%

subplot(2,3,1), imshow(II, 'InitialMagnification', 500), 
title('regular degree=1');
hold on 
plot(x_select, y_select, 'r.'); % plot the points we select
hold on

x_select=[x_select,x_select(1)];
y_select=[y_select,y_select(1)];
for j1 = 1 : length(x_select)-1   % choose two points in order at one time
    s1 = (1 : 1 : 2);             % use s change y(x) into y(s) and x(s)
    s1_after = (1: 0.1 : 2);
    
    k = (j1 : j1+1);
   
    p_x1 = polyfit(s1, x_select(k), 1); % get the value after poly. interp.
    x_po1 = polyval(p_x1, s1_after);
    
    p_y1 = polyfit(s1, y_select(k), 1);
    y_po1 = polyval(p_y1, s1_after);
    
    
    plot(x_po1, y_po1, 'b-');
    hold on
end
hold off


%%%%%%% Polynomial Degree = 2 %%%%%%%
subplot(2,3,2), imshow('tumor.jpg', 'InitialMagnification', 500), 
title('regular degree=2');
hold on 
plot(x_select, y_select, 'r.'); % plot the points we select
hold on


x_select=[x_select,x_select(1)];
y_select=[y_select,y_select(1)];
n = floor((length(x_select)-3) / 2);
for j2 = 0 : n                 % choose three points in order at one time
    s2 = (1 : 1 : 3);
    s2_after = (1 : 0.1 : 3);
    
    k = (2*j2+1 : 2*j2+3);
    
    p_x2 = polyfit(s2, x_select(k), 2);
    x_po2 = polyval(p_x2, s2_after);
    
    p_y2 = polyfit(s2, y_select(k), 2);
    y_po2 = polyval(p_y2, s2_after);

   
    plot(x_po2, y_po2, 'b-');
    hold on
end
hold off


%%%%%%% Polynomial Degree = 3 %%%%%%%
subplot(2,3,3), imshow('tumor.jpg', 'InitialMagnification', 500), 
title('regular degree=3');
hold on 
plot(x_select, y_select, 'r.'); % plot the points we select
hold on



n = floor((length(x_select)-4) / 3);
x_select=[x_select,x_select(1)];
y_select=[y_select,y_select(1)];
for j3 = 0 : n               % choose four points in order at one time
    s3 = (1 : 1 : 4);
    s3_after = (1 : 0.1 : 4);
    
    k = (3*j3+1 : 3*j3+4);
    
    p_x3 = polyfit(s3, x_select(k), 3);
    x_po3 = polyval(p_x3, s3_after);
    
    p_y3 = polyfit(s3, y_select(k), 3);
    y_po3 = polyval(p_y3, s3_after);
  
    
    plot(x_po3, y_po3, 'b-');
    hold on
end
hold off
