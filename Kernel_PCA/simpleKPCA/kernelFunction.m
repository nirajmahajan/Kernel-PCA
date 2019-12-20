%% Gaussian or Polynomial Kernel
% A standard gaussian or polynomial kernel
function [val] = kernelFunction(x,y, mode, parameter)
    if(strcmp(mode, 'gaussian'))
        sigma = parameter;
        val = exp(-(norm(x-y)^2)/(2*sigma*sigma));
    elseif(strcmp(mode, 'polynomial'))
        p = parameter;
        val = (1+x'*y)^p;
    end
end

