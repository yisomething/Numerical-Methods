function [M,L] = elimMat(A,k)
   [m,~] = size(A);
   M = eye(m);
   for i = k+1:m
    M(i,k)= -(A(i,k)/A(k,k));
   end
        L = inv(M);
end