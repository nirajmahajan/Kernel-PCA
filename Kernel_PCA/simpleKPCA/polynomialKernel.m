%% Polynomial Kernel
% A standard polynomial kernel
function [val] = polynomialKernel(x,y)
    p = 2;
    val = (1+sum(x.*y))^p;
end

