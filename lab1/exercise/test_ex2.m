% Example 2.13 3*3
A = [1 2 2;4 4 2;4 6 4];
b = [3 6 10]';
[L,U] = myLU(A);
y = fwdSubst(L,b);
x = bwdSubst(U,y);
disp('result of example 2.13');
disp(x);

% my own design 4*4
A1 = [2 1 -1 2;4 5 -3 6;-2 5 -2 6;4 11 -4 8];
b1 = [5 9 4 2]';
[L1,U1] = myLU(A1);
y1 = fwdSubst(L1,b1);
x1 = bwdSubst(U1,y1);
disp('result of my own design');
disp(x1);