% CS 229 Homework 1 Problem 1 %
close all; clear all; clc;

% (b) %
% Load data %
x = load('q1x.dat');
y = load('q1y.dat');

% lambda functions for sigmoid %
h = @(x,theta)(1/(1+exp(-theta'*x)));
s = @(x,theta)(h(x,theta)*(1-h(x,theta))*x*x');


% Newton's Method implementation %
alpha = 2;          % Learning rate             %
iters = 100;        % Maximum iterations        %
eps = 1e-5;         % Convergence threshhold    %

[n,m] = size(x);
m = m + 1;
theta = zeros(m,1);

for k = 1:iters,
    % Calculate H and grad %
    H = zeros(m,m);
    g = zeros(m,1);
    for i = 1:n,
        xx = [1 x(i,:)]';
        g = g +(y(i)-h(xx,theta))*xx;
        H = H - s(xx,theta);
    end
    
    % Check for convergence %
    theta_next = theta - alpha*H\g;
    if norm(theta_next - theta) < eps,
        theta = theta_next;
        break;
    end
    
    % Update theta %
    theta = theta_next;
end


% (c) %
% Generate scatter plot of classification data %
figure;
hold on;
title('Problem 1 (c) - Logistic Regression');
xlabel('x_1');
ylabel('x_2');
for i = 1:n,
    if y(i) == 0,
        scatter(x(i,1),x(i,2),'xr');
    else
        scatter(x(i,1),x(i,2),'og');
    end
end
% Generate decision boundary %
xx = linspace(min(x(:,1)),max(x(:,1)));
yy = (-theta(1)-theta(2)*xx)/theta(3);
plot(xx,yy,'k--');

% Generate prediction plot on training set for initial sanity check %
%{
figure;
hold on;
for i = 1:n,
    if h([1;x(i,:)'],theta) < .5,
        scatter(x(i,1),x(i,2),'xr');
    else
        scatter(x(i,1),x(i,2),'og');
    end
end
%}