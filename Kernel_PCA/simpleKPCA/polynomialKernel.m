% A standard gaussian kernel
function [val] = polynomialKernel(x,y)
    p = 3;
    val = (1+x'*y)^p;
end

