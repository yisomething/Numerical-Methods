% Vectorize the following
% Note the use of the tic/toc calls to time execution
% Compare the time once you have vectorized it

tic
for i = 1:1000
    t(i) = 2*i;
    y(i) = sin (t(i));
end
toc

clear;

%without loops shorter, fewer lines
tic 
i = 1:1000;
y(i) = sin(2*i);
toc

clear;
