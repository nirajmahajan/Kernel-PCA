% A standard gaussian kernel
function [val] = gaussianKernel(x,y)
    val = exp(-(norm(x-y)^2)/(2))/sqrt(2*pi);
end

