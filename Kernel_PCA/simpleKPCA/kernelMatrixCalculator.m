%% Generates the Centred Kernel Matrix
% The input data can be non centred
function [KNC] = kernelMatrixCalculator(data, kernelFunc)
    %% Calculate K for centred data
    [row, ~] = size(data);
    K = zeros(row, row);
    for i = 1:row
        for j = 1:row
            K(i, j) = kernelFunc(data(i,:), data(j, :));
        end
    end
    %% Now calculate for uncentred data as well
    % Refer to https://www.youtube.com/watch?v=_CbHRMkoRrg
    J = eye(row) - (1/row)*ones(row);
    KNC = J*K*J;
end

