function Y_new=polynomial_interp(X,Y,X_new,n) 
    A = ones(length(X), n);
    for i = 1:n 
        A(:,i+1) = (X').^(i);
    end
    co = flipud(A\Y')'; %reverse order
    Y_new = polyval(co, X_new); 
end