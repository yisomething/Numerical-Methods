close all;
clear all;

z=9;
xk=4;
r=[xk];
for i=1:20
%xk=(z+xk)/(1+xk);
  xk=0.5 * (xk + z/xk);
  r=[r xk];
end


odd=r(:,1:2:end);
 even=r(:,2:2:end);
hold on
 odde=abs(odd-4*ones(size(odd)));
 evene=abs(even-4*ones(size(even)));

e=abs(r-sqrt(z)*ones(size(r)));

plot(r);
 %plot(odd);
 %plot(even,'--');
plot(e);
title('z = 9 x =4');
hold off