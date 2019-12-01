%% Generates the Centred Kernel Matrix
% The input data can be non centred
function [K] = kernelMatrixCalculator(data, type)
    %% Calculate K for centred data
    if(strcmp(type, 'poly'))
        kernelFunc = @polynomialKernel;
    end
    if(strcmp(type, 'gauss'))
        kernelFunc = @gaussianKernel;
    end
    
 
    [row, ~] = size(data);
    K = zeros(row, row);
    for i = 1:row
        for j = 1:row
            K(i, j) = kernelFunc(data(i,:)', data(j, :)');
        end
    end
end

