% CS 229 Homework 1 Problem 2 (d) %
close all; clear all;

% Load data %
x = load('q2x.dat');
y = load('q2y.dat');

% (i) %
% Unweighted least squares %
% minimizing || y - x'*theta || %

theta = x\y;   % x\y = pinv(x) * y = inv(x'*x)*x'*y %

xx = linspace(min(x),max(x));
yy = theta*xx;

% plot linear regression %
subplot(321);
scatter(x,y); hold on;
plot(xx,yy,'r');
title('Linear Regression');


% (ii) & (iii) %
Ts = [0.1 ; 0.3 ; 0.8 ; 2 ; 10];
n = length(x);
X = [ones(n,1), x];

for i = 1:5,
    t = Ts(i);
    yy = [];
    for xx = linspace(min(x),max(x)),
        W = zeros(n,1);
        for j = 1:n,
           W(j) = .5*exp(-(xx-x(j))^2/(2*t^2));
        end
        W = diag(W);
        
        % Faster way to implement theta = inv(X'*W*X)*X'*W*y %
        D = W.^.5;
        theta = (D*X)\D*y;
        
        yy = [yy theta'*[1;xx]];
    end
    subplot(3,2,i+1);
    scatter(x,y); hold on;
    plot(linspace(min(x),max(x)), yy, 'r');
    title(sprintf('Weighted Regression tau = %.1f',t));
end