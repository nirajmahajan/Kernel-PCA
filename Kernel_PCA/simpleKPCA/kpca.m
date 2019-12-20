% dataset is a MxN matrix, where M is the sample size
% mode is either 'polynomial' or 'gaussian'
% parameter is the standard deviation for the gaussian or 
%              the degree of the polynomial
% n_components is the number of eigenvectors to be considered
function [Y, inversion_store] = kpca(dataset, mode, parameter, n_components)

    limit = n_components;
    %% Create the Kernel Matrix from uncentered Data
    K1 = kernelMatrixCalculator(dataset, mode, parameter);
    [N, ~] = size(dataset);
    oneN=ones(N)/N;
    K=K1-oneN*K1-K1*oneN+oneN*K1*oneN;

    K = (K + K')/2;
    
    %% Perform SVD
    [V1, E1] = eig(K);  
    
    
    Eigvals = diag(E1);
    [~,IX]=sort(Eigvals,'descend');
    Vec=V1(:,IX);
    Eigvals = Eigvals(IX);
    Vec = Vec(:, 1:limit);
    Eigvals = Eigvals(1:limit);
    

%     [rn, cn] = size(Vec);
%     Mstore = zeros(rn);
%     for i = 1:cn
%         Mstore(i) = (Vec(i)*Vec(i)')/Eigvals(i);
%     end
    
    %% Perform Normalization
    div=sqrt(Eigvals);
    Vec=Vec./(div*ones(1,N))';
    
    %% Transform Data into new dimensions (along the best d eigenvectors)
%     Y = projectData(Vec, K1, 2);
    Y = K1 * Vec;
    
    %% populate the inversion store
    keys = {'X', 'eigV', 'K', 'projected_data', 'mode', 'parameter'};
    vals = {dataset, Vec, K1, Y, mode, parameter};
    inversion_store = containers.Map(keys, vals);
end