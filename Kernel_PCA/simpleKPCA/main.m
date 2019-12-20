clear;clc; close all; rng(1);
sampleSize = 400;
limit = 2;
%% Kernel PCA on circular DATA
% In this code, we have generated some circular data with some noise (2D data)
% We will perform kernel PCA on this data using gaussian and polynomial
% kernels

%% Generate Data
dataset = dataGenerator(true, sampleSize);

%% Perform kernel PCA
[YG, ISG]= kpca(dataset, 'gaussian', 3, 2);
[YP, ISP]= kpca(dataset, 'polynomial', 2, 2);

%% Plot the Gaussian kernal data
figure(2);
a = sampleSize;
b = 2 * a;
c = 3 * a;
scatter(YG(1:a,1), YG(1:a,2), 'r');
hold on;
scatter(YG(a+1:b,1), YG(a+1:b,2), 'g');
hold on;
scatter(YG(b+1:c,1), YG(b+1:c,2), 'b');
hold on;
xlabel('First Component');
ylabel('Second Component');
title('Gaussian Kernel');
hold off;


%% Plot the Polynomial kernal data
figure(3);
scatter(YP(1:a,1), YP(1:a,2), 'r');
hold on;
scatter(YP(a+1:b,1), YP(a+1:b,2), 'g');
hold on;
scatter(YP(b+1:c,1), YP(b+1:c,2), 'b');
hold on;
xlabel('First Component');
ylabel('Second Component');
title('Polynomial Kernel');
hold off;

%% Draw and plot pre-images for Gaussian
n = 3;
pre_images_gaussian = zeros(size(dataset));
for i = 1:length(YG)
    pre_images_gaussian(i,:) = invert(YG(i,:)', ISG, n)';
end
figure(4);
scatter(pre_images_gaussian(1:a,1), pre_images_gaussian(1:a,2), 'r');
hold on;
scatter(pre_images_gaussian(a+1:b,1), pre_images_gaussian(a+1:b,2), 'g');
hold on;
scatter(pre_images_gaussian(b+1:c,1), pre_images_gaussian(b+1:c,2), 'b');
hold on;
xlabel('X');
ylabel('Y');
title('Gaussian Kernel Pre Images');
hold off;


% %% Draw and plot pre-images for Polynomial
% pre_images_poly = zeros(size(dataset));
% for i = 1:length(YG)
%     pre_images_poly(i,:) = invert(YP(i,:)', dataset, YP, n)';
% end
% figure(5);
% scatter(pre_images_poly(1:a,1), pre_images_poly(1:a,2), 'r');
% hold on;
% scatter(pre_images_poly(a+1:b,1), pre_images_poly(a+1:b,2), 'g');
% hold on;
% scatter(pre_images_poly(b+1:c,1), pre_images_poly(b+1:c,2), 'b');
% hold on;
% xlabel('X');
% ylabel('Y');
% title('Polynomial Kernel Pre Images');
% hold off;