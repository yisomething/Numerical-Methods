function theta = invKin3D(M,theta0,pos)

    % Newton's method 
    n=200;
    for i = 1:n
        [p,J] = evalRobot3D(M,theta0);
        f = p - pos; 
        s = J \ -f;
        theta = theta0 + s;
        diff = norm(f);
       
        if diff < 0.0001
            break;
        end
        theta0 = theta;
    end
end
    