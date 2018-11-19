function theta = invKin2D(l,theta0,pos,n,mode)

% mode==0 Newton's method
if mode == 0
    for k = 1:n
        [p,J] = evalRobot2D(l,theta0);
        f = p - pos;    
        s = J \ -f;
        theta = theta0 + s;       
        diff = norm(f);
        if diff < 0.0001
            break;
        end
        theta0 = theta;
    end


% mode==1 Broyden's method
elseif mode == 1
    [~,B0] = evalRobot2D(l,theta0);
    for k = 1:n
        p = evalRobot2D(l,theta0);
        f = p - pos;
        s = B0 \ -f;
        theta = theta0 + s;
        y = evalRobot2D(l,theta) - evalRobot2D(l,theta0);
        B = B0 + ((y-B0*s)*s')/(s'*s);
        diff = norm(f);
        if diff < 0.0001
            break
        end
        theta0 = theta;
        B0 = B;
    end
end

end