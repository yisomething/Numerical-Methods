%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 1 of lab2
% source & reference:
% https://www.mathworks.com/help/matlab/ref/inf.html about Inf
% https://www.mathworks.com/help/matlab/ref/spline.html about spline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I = imread('tumorContour.jpg');[x,y] = find(I>250); 


% get selected dot
tumor = imread('tumor.jpg');
f1 = figure; imshow(tumor, 'InitialMagnification', 200); % enlarge the image
[x_select, y_select] = ginput; 
x_select = x_select';  
y_select = y_select';
close();

% plot selected dot
f2 = figure;imshow(tumor, 'InitialMagnification', 200); title('fit tumor');
hold on 
plot(x_select, y_select, 'r.'); 
hold on

% fit selected dot
x_select=[x_select,x_select(1)];    % in order to return the initial point
y_select=[y_select,y_select(1)];
s = (1 : 1 : length(x_select));      % use s change y(x) into y(s) and x(s)   
s_after = (1 : 0.1 : length(x_select));

co_x = spline(s, x_select); % cubic spline interpolation, get coefficient
x_pol = ppval(co_x, s_after); % evaluates the piecewise polynomia
co_y = spline(s, y_select);  
y_pol = ppval(co_y, s_after);

plot(x_pol, y_pol, 'b-');


% calculate sum error and avg error
num = length(x_pol);
error = 0;
correspond = Inf;

for i = 1:num
    for j = 1:length(x)
        d = norm([x_pol(i),y_pol(i)]-[x(j),y(j)]); % calculate distance
        if d < correspond       % find the nearest point
            correspond = d;
        end
    end
    error = error + correspond; % sum error
    correspond = Inf;
end

avg_error = error / ((length(x_select)-1)/0.1 + 1); % get average error
display(avg_error);








