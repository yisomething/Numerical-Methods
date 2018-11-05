close all;
clear all;

xk=0.14;
%r=[xk];
%error =[]; 
k=0;
disp('    k        xk        f(x)       f`(x)       error');
for i=1:10
  f = 2*(xk+100/xk)*(atan(xk/10))-20.002;
  fd = (2-200/xk^2)*(atan(xk/10))+20/xk;
  xk1=xk-f/fd;
  
  %r=[r xk];
  error = -f/fd;
  
  
  disp([k xk f fd error]);
  xk=xk1;
  k = k+1;
end