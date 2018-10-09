%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 1 of lab2
% source & reference:
% https://www.mathworks.com/help/matlab/ref/inf.html about Inf
% https://www.mathworks.com/help/matlab/ref/spline.html about spline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I = imread('tumorContour.jpg');[y,x] = find(I>250); 


% get selected dot
tumor = imread('tumor.jpg');
f1 = figure; imshow(tumor, 'InitialMagnification', 200); % enlarge the image
[x_select, y_select] = ginput; 
hold off
x_select = x_select';  
y_select = y_select';
close();

% plot selected dot
f2 = figure;imshow(tumor, 'InitialMagnification', 200); title('fit tumor');
hold on 
plot(x_select, y_select, 'r.'); 
hold on
sum_error =0;

% fit selected dot
x_select=[x_select,x_select(1)];    % in order to return the initial point
y_select=[y_select,y_select(1)];

s = (1 : 1 : length(x_select));      % use s change y(x) into y(s) and x(s)   
s_after = (1 : 0.1 : length(x_select));

co_x = spline(s, x_select); % cubic spline interpolation, get coefficient
x_pp = ppval(co_x, s_after); % evaluates the piecewise polynomia
co_y = spline(s, y_select);  
y_pp = ppval(co_y, s_after);

plot(x_pp, y_pp, 'b-');


% calculate sum error and avg error

error = cal_error(x,y,x_pp,y_pp);
sum_error = error +sum_error;
avg_error = sum_error /((length(x_select)-1)/0.1 + 1); 
display(avg_error);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function error =cal_error(x, y, x_pol, y_pol)
num = length(x_pol);
error = 0;
correspond = Inf;

for i = 1:num
    for j = 1:length(x)
        d = norm([x(j),y(j)]-[x_pol(i),y_pol(i)]); 
        if d < correspond       % find the correspond point
            correspond = d;
        end
    end
    error = error + correspond; % sum error
    correspond = Inf;
end
end









