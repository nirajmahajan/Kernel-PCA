% The data has initially 'D' dimensions
% After KPCA, the data has 'd' dimensions
% function parameters:
% data is a d dimension vector to transform to orignal space
% K is the computed kernel matrix
% kfun is the kernel function
% inversion_store is a map container that has the above variables
% neigbours are the number of nearest neighbours to be considered while
%           drawing the pre image (recommended 10)
function [Y_out] = invert(data, inversion_store, N)
    clc;
    %% Initialize Variables
    X = inversion_store('X');
    mode = inversion_store('mode');
    parameter = inversion_store('parameter');
    projected_data = inversion_store('projected_data');
    M = length(X);
    oneN = (1/N)*ones(N, 1);
    H = eye(N) - N*(oneN*oneN');
%     K = inversion_store('K');

    %% Find the distances of the data with projected points 
    d = vecnorm((projected_data - repmat(data', M, 1))')'.^2;
    
    %% Convert the distance to input space
    beta = 1/(2*parameter*parameter);
    Kimg = kernelFunction(data, data, mode, parameter);
    KX = zeros(M, 1);
    for i = 1:M
        KX(i) = kernelFunction(X(i,:)', X(i, :)', mode, parameter);
    end
    d = (-1/beta) * log((0.5)*(KX + Kimg - d));
    
    [~,IX]=sort(d);
    d = d(IX);
    d = d(1:N);
    X = X(IX, :);
    X = X(1:N, :)';    
    
    [U, S, Vt] = svd(X*H);
    Z = S * Vt;    
    d0 = vecnorm(Z)';
    zinv = (Z*Z')\Z;
    zhat = (-1/2)*(zinv)*(d.^2 - d0.^2);
    Y_out = U*zhat + mean(X,2);
    Y_out = mean(X')';
end

