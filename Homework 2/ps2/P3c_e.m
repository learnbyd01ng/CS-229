% (c) - (e) %
numSamps = [50; 100; 200; 400; 800; 1400];

Enb = zeros(6,1);
Esvm = zeros(6,1);
for j = 1:6,
    name = sprintf('MATRIX.TRAIN.%d',numSamps(j));
    % (c) %
    nb_train;
    nb_test;
    Enb(j) = error/numTestDocs;
    
    % (d) %
    svm_train;
    svm_test;
    Esvm(j) = error/numTestDocs;
end

plot(numSamps,Enb); hold on;
plot(numSamps,Esvm,'r');
legend('Naïve Bayes','Support Vector Machine');
