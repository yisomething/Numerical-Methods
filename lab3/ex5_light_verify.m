% From the original coefficients Y, 
% pick one (or more) t-values, 
% and omit the sets of coefficients Y(:,t) corresponding to image t
% we choose degree 1 here, least error
load('light_pca.mat');
X_omit = [-120, -70];
Y_omit = [Y(:,1), Y(:,3)];
X_omit_new = [-120,-95,-70];
Y_new =zeros(1,14);
for i = 1:size(Y,2)
    Y_omit_new = polynomial_interp(X_omit,Y_omit(i,:),X_omit_new,1);
    Y_new(i) = Y_omit_new(2);
end

img = reshape(B * Y(:,2), imsize);
subplot(2,1,1)
imshow(img)
title('original');

img_approx = reshape(B * Y_new', imsize);
subplot(2,1,2)
imshow(img_approx)
title('approximation');

error = norm(img_approx - img);
disp('the error is');
disp(error);
