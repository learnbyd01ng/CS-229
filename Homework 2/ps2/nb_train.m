% nb_train.m %

name = 'MATRIX.TRAIN';          % This line removed for parts (c) and (d) %
[spmatrix, tokenlist, trainCategory] = readMatrix(name);

trainMatrix = full(spmatrix);
numTrainDocs = size(trainMatrix, 1);
numTokens = size(trainMatrix, 2);

% Starter code comments here omitted to save space %
% YOUR CODE HERE %

numSpam = sum(trainCategory);
numNon = numTrainDocs - numSpam;

p0 = (numNon+1)/(numTrainDocs+2);       % Laplace smoothed ML of p0
p1 = (numSpam+1)/(numTrainDocs+2);      % Laplace Smoothed ML of p1

phi = zeros(2,numTokens);

for docNum = 1:numTrainDocs,
    phi(trainCategory(docNum)+1,:) = ...
        phi(trainCategory(docNum)+1,:) + trainMatrix(docNum,:);
end

n0 = sum(sum(trainMatrix(trainCategory == 0,:)));
n1 = sum(sum(trainMatrix(trainCategory == 1,:)));


% Laplace Smoothed log-(ML of phi) %
logphi0 = log(phi(1,:) + ones(1,numTokens)) - log(n0 + numTokens);
        
logphi1 = log(phi(2,:) + ones(1,numTokens)) - log(n1 + numTokens);