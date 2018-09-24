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
