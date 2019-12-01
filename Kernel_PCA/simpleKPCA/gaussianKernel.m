%% Gaussian Kernel
% A standard gaussian kernel
function [val] = gaussianKernel(x,y)
    val = exp(-(norm(x-y)^2)/(20));
end

