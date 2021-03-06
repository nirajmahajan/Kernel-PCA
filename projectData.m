%% Project data to a limit of l output dimensions
function [Y] = projectData(EV, Kernel, limit)
    N = size(Kernel, 1);
    Y = zeros(N, limit);
    for i = 1:N
        Y(i, :) = (EV' * Kernel(:, i))';
    end
end

