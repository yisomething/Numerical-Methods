% full rank A, solved by LU, remove b2 b8 b12
A = [1 1 1 0 0 0 0 0 0; %b3
     0 0 0 0 0 0 1 1 1; %b1
     1 1 0 1 0 0 0 0 0; %b6
     0 0 1 0 1 0 1 0 0; %b5
     0 0 0 0 0 1 0 1 1; %b4
     1 0 0 1 0 0 1 0 0; %b9
     0 1 1 0 0 1 0 0 0; %b10
     1 0 0 0 1 0 0 0 1; %b11
     0 0 1 0 0 1 0 0 1];%b7
 b = [8.00; 13.00; 3.81; 14.31; 14.79; 6.00;18.00;10.51;16.13];
 [L,U]=lu(A);
 y=L\(b);
 x=U\y;
 disp(x);
 % the overdetermined system
 Ao = [1 1 1 0 0 0 0 0 0;
       0 0 0 1 1 1 0 0 0;
       0 0 0 0 0 0 1 1 1;
       1 1 0 1 0 0 0 0 0;
       0 0 1 0 1 0 1 0 0;
       0 0 0 0 0 1 0 1 1;
       1 0 0 1 0 0 1 0 0;
       0 1 0 0 1 0 0 1 0;
       0 0 1 0 0 1 0 0 1;
       0 1 1 0 0 1 0 0 0;
       1 0 0 0 1 0 0 0 1;
       0 0 0 1 0 0 1 1 0];
  bo = [8 15 13 3.81 14.31 14.79 6 12 18 10.51 16.13 7.04]';
  xo = Ao\bo;
  disp(xo);
  
  % The overdetermined system is better because it used more equations to
  % make data more precise. 
  
  
  
    
 
 