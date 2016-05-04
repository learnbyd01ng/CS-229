% svm_test.m %

addpath('liblinear-2.1/matlab');  % add LIBLINEAR to the path
[sparseTestMatrix, tokenlist, testCategory] = readMatrix('MATRIX.TEST');

numTestDocs = size(sparseTestMatrix, 1);
numTokens = size(sparseTestMatrix, 2);

output = zeros(numTestDocs, 1);

% YOUR CODE HERE
output = predict(output, sparseTestMatrix, model);


% Compute the error on the test set
error=0;
for i=1:numTestDocs
  if (testCategory(i) ~= output(i))
    error=error+1;
  end
end

%Print out the classification error on the test set
error/numTestDocs
