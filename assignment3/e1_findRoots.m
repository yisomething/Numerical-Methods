close all;
clear all;

xk=-1;
%r=[xk];
%error =[]; 
k=0;
disp('    k        xk        f(x)       f`(x)       error');
for i=1:10
  f = sin(10*xk)-xk;
  fd = 10*cos(10*xk)-1;
  xk1=xk-f/fd;
  
  %r=[r xk];
  error = -f/fd;
  
  
  disp([k xk f fd error]);
  k = k+1;
  xk=xk1;
end