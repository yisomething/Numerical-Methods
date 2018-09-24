%L = [1 0 0;-2 1 0;1 0 1];
%b = [2 0 0]';
%fwdSubst(L,b)

%U = [1 2 2;0 -4 -6;0 0 -1];
%b = [3 -6 1]';
%bwdSubst(U,b)

A = [1 2 2;4 4 2;4 6 4];
[M,L] = elimMat(A,1);
[C,D] = elimMat(M*A,2);

%A = [1 2 2;4 4 2;4 6 4];
b = [3 6 10]';
[L,U] = myLU(A)
y = fwdSubst(L,b);
x = bwdSubst(U,y);





function [L,U] = myLU(A)
    [n,~]= size(A);
    L = eye(n);
    U = A;
    for k = 1:(n-1)
        [u,l] = elimMat(A,k);
        L = L*l;
        U = u*U;
        A = u*A;
    end 
   
end
                                               

function [M,L] = elimMat(A,k)
   [m,~] = size(A);
   M = eye(m);
   for i = k+1:m
    M(i,k)= -(A(i,k)/A(k,k));
   end
        L = inv(M);
end

        
    
   


    

function y = fwdSubst(L,b,k)
    [m,n]=size(L);
    if ~exist('k')
        k = 1;
    end
    
    y = b(k)/L(k,k);
    if k < n % Recursion step
        l = [zeros(k,1);L(k+1:m,k)];
        y = [y;fwdSubst(L, b-y*l,k+1)];
    end
end
        



function x = bwdSubst(U,b,k)

  [m,n]=size(U);
  if ~exist('k')  % If first call no k param given, but k=1
    k=n;
  end
  
  x=b(k)/U(k,k);
  if k >1 % Recursion step
    l = [U(1:k-1,k);zeros(m-k+1,1)]; %intermediate value here the row sum is m. k-1 +? = m. ? =m-k+1 
    x = [x;bwdSubst(U,b-x*l,k-1)]; %update b
  end
  
end





    
    


















