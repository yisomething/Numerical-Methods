%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is exercise 3c1 of lab01, cmput 340
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('char_c1.mat');
[~,n]=size(Bchar);
for i=1:n
    img1 = reshape(Achar \ Bchar(:,i),imsize)';
    figure(1);
    subplot(1,n,i)
    imshow(img1);
end

pause();

load('mri_c1.mat');
[~,n]=size(Bmri);
for j = 1:n 
    img2 = reshape(Amri \ Bmri(:,j),imsize)';
    figure(2);  
    subplot(1,n,j)
    imshow(img2);
end

