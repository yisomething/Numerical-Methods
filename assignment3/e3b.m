close all;
clear all;

xk=0.1;
%r=[xk];
%error =[]; 
k=0;
disp('    k        xk        f(x)       f`(x)       error');
for i=1:10
  f = (10*xk-1)*(1+xk)^20+1;
  fd = 10*(1+xk)^20+(xk+1)^19*(200*xk-20);
  xk1=xk-f/fd;
  
  %r=[r xk];
  error = -f/fd;
  
  
  disp([k xk f fd error]);
  k = k+1;
  xk=xk1;
end