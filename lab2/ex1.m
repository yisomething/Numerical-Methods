%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Exercise 1 of lab2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% error_x is the error between the interpolated y value and the ground-truth on X
% error_x_new is the error between the interpolated y and the ground-truth on X_new

m = [0.5 1 2 3];
n1 =10;  
n2 =11;
n3 =11;
n4 =11;
n = [n1 n2 n3 n4];
error_x = zeros(1,length(m));
error_x_new = zeros(1,length(m));
for i= 1:length(m)
    x = (0:0.5:m(i)*pi);
    y = sin(x);

    x_new = (0:0.1:2^(1/n(i))*m(i)*pi);
    y_sin = sin(x_new);

    y_new = polynomial_interp(x,y,x,n(i));
    error_x(i) = norm(y' -  y_new);

    y_new = polynomial_interp(x,y,x_new,n(i));
    error_x_new(i) = norm(y_sin' - y_new);

    subplot(2,2,i), plot(x_new, y_sin, 'r.', x_new, y_new, 'b-');
    title(['m=',num2str(m(i)),' n=',num2str(n(i))]);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Y_new=polynomial_interp(X,Y,X_new,n) 
    A = ones(length(X), n);
    for i = 1:n 
        A(:,i+1) = (X').^(i);
    end
    co = flipud(A\Y')'; %reverse order
    Y_new = polyval(co, X_new); 
end
