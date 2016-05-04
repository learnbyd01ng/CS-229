% part (b) %
close all; clear all; clc;
nb_train;

tok_array = strread(tokenlist,'%s','delimiter',' ');

loglikelihood = logphi1-logphi0;

[~,inds] = sort(loglikelihood,'descend');

toks = [];
for i = 1:5,
    toks = [toks; tok_array(inds(i))];
end
        