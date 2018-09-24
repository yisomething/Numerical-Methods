function [L,U] = myLU(A)
    [m,~]= size(A);
    L = eye(m);
    U = A;
    for k = 1:(m-1)
        [u,l] = elimMat(A,k);
        L = L*l;
        U = u*U;
        A = u*A;
    end 
   
end