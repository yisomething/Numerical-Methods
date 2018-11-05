close all;
clear all;

xk=10;
%r=[xk];
%error =[]; 
k=0;
disp('    k        xk        f(x)       f`(x)       error');
for i=1:10
  f = (1.06)^xk-2.5;
  fd = log((53/50))*(53/50)^xk;
  xk1=xk-f/fd;
  
  %r=[r xk];
  error = -f/fd;
  
  
  disp([k xk f fd error]);
  k = k+1;
  xk=xk1;
end