% Function for training a single layer perceptron (SLP)
% using Delta rule
%
% INPUTS  : Training data x 
% OUTPUTS : Weights w, Bias b
%
% Author: Spiros Papadopoulos

function [W, b, yPred] = perceptron(x, y)

% Initialize weight vector
W = rand(1, size(x,2) + 1)'; % (n+1) x 1

% Create x matrix and append ones in last column
x = [x ones(length(x),1)];   % K x (n+1)

% Define total number data
K = length(x);

% Define learning rate 
learningRate = 0.5; % 0 < learningRate <= 1

% Update Weights based on Widrow-Hoff rule
yTarget = y;                      % Desired output values (class 1 or class 2)
yPred = zeros(length(yTarget),1); % Initialize prediction vector

% Initialize epoch
epoch = 0;

% k = 1
yPred(1) = sign(x(1,:)*W);
W = W + learningRate*(yTarget(1)-yPred(1))*x(1,:)';

yPred = sign(x*W);

while ~isequal(yPred,yTarget)
    for k = 1:K
        yPred(k) = sign(x(k,:)*W);                          % Perceptron Prediction
        W = W + learningRate*(yTarget(k)-yPred(k))*x(k,:)'; % Weight Update
        epoch = epoch + 1;
    end
    yPred = sign(x*W);
    accuracy = sum(yTarget==yPred)/length(yTarget) * 100;
    fprintf("Epoch = %d  Accuracy = %.2f%%  \n", epoch, accuracy);
end

% Extract final weights and bias
b = W(end);
W = W(1:end-1);


end