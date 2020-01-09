%% Generates the Centred Kernel Matrix
% The input data can be non centred
function [K] = kernelMatrixCalculator(data, mode, parameter)
    %% Calculate K for centred data   
 
    [row, ~] = size(data);
    K = zeros(row, row);
    for i = 1:row
        for j = 1:row
            K(i, j) = kernelFunction(data(i,:)', data(j, :)', mode, parameter);
        end
    end
end

