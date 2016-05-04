% svm_train.m %

addpath('liblinear-2.1/matlab');  % add LIBLINEAR to the path
[sparseTrainMatrix, tokenlist, trainCategory] = readMatrix(name);

numTrainDocs = size(sparseTrainMatrix, 1);
numTokens = size(sparseTrainMatrix, 2);

% YOUR CODE HERE
categories = full(trainCategory)';
model = train(categories, sparseTrainMatrix);