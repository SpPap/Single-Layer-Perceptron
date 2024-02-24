# Single Layer Perceptron Project
This repository intends to provide code for a single layer perception (SLP) algorithm in order to solve a binary classification problem. 
The problem to be solved is an optical recognition of two characters ("O" and "I"). The available data consists of two properties. The first one is the total number of pixels contained in the character and the variance present in x-axis.
The perceptron will be tested in both training and validation data.

For  activation function, the signum function is chosen because we deal with binary classification. Thus, if y=1 then input belongs to class 1 ("I") otherwise if y=-1 then belongs to class 2 ("O").


# Perceptron overview
![perceptron](https://github.com/SpPap/Single-Layer-Perceptron/assets/52887728/fafa2d0c-59f3-4d89-8ce0-5efe5eaa8c6d)

Perceptron's prediction
$$\widehat{y}(k) = \phi[\mathbf{w}^T(k))\mathbf{x}(k))]$$

Weights adaptation based on Widrow-Hoff rule
$$\mathbf{w}^{new} = \mathbf{w}^{old} + \eta(y(k)-\hat{y}(k))\mathbf{x}^T(k) $$

# Results
### Training Data with Decision Limit
![training data](https://github.com/SpPap/Single-Layer-Perceptron/blob/main/results/trainingData.jpg?raw=true) 

### Validation Data with Decision Limit
![validating data](https://github.com/SpPap/Single-Layer-Perceptron/blob/main/results/validationData.jpg?raw=true) 
