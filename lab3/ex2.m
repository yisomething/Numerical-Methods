load("sincos_basis.mat");

%%%%%%%%%%%%%%%%%%%%%%%%% twice the frequency %%%%%%%%%%%%%%%%%%%%%%%%%%
f1 = figure();
% sin2ax = 2*sinax*cosax
% cos2ax = cosax^2 - sinax^2
sin2ax = 2 * (B(:,1) .* B(:,2));     
cos2ax = (B(:,2)).^2 - (B(:,1)).^2;  
B_new = [sin2ax, cos2ax];
for i = 1:64  
    li_1 = renderim(Y(:,i), B, imsize); 
    subplot(2,1,1);
    imshow(li_1,[]);
    title('Original basis'); 
    drawnow;
    pause(0.1);
    
    % clear all();
    % twice frenquency
    li_2 = renderim(Y(:,i), B_new, imsize); 
    subplot(2,1,2);
    imshow(li_2,[]),title('Basis with twice the frequency');
    drawnow;
    pause(0.1);
end


%%%%%%%%%%%%%%%%%%%%% change b (value and sign) %%%%%%%%%%%%%%%%%%%%%%%%%%
f2 = figure();
% cos2bx = cosbx^2 - sinbx^2 = Y(1,:)^2 - Y(2,:)^2
% sin2ax = 2sinbx * cosbx =2*Y(1,:)*Y(2,:)
Y_2b = [(Y(1,:)).^2 - (Y(2,:)).^2;2 * (Y(1,:) .* Y(2,:))];
for i = 1:64
    li_3 = renderim(Y(:,i), B, imsize); 
    subplot(2,1,1);
    imshow(li_3,[]),title('slow, original b');
    drawnow;
    pause(0.1);
    
    li_4 = renderim(Y_2b(:,i), B, imsize);
    subplot(2,1,2);
    imshow(li_4,[]),title('faster, 2*b');
    drawnow;
    pause(0.1);
end

f3 = figure();
% cos(-bt) = cos(bt)
% sin(-bt) = -sin(bt)
Y_negb = [Y(1,:);-Y(2,:)];
for i = 1:64
    li_5 = renderim(Y(:,i), B, imsize); 
    subplot(2,1,1);
    imshow(li_5,[]),title('original b');
    drawnow;
    pause(0.1);
    
    li_6 = renderim(Y_negb(:,i), B, imsize);
    subplot(2,1,2);
    imshow(li_6,[]),title('changed sign b');
    drawnow;
    pause(0.1);
end


