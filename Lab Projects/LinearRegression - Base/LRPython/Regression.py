import math

from ctypes import *
lib = cdll.LoadLibrary("Regression.dll")

def linearHeuristic(features, featureIndex, inputWeights, bias):
    numInputs = len(inputWeights)

    #but what does C say?
    cFeatures = (c_float * len(features[featureIndex]))(*features[featureIndex])
    cWeights = (c_float * len(inputWeights))(*inputWeights)
    cBias = c_float(bias)
    cRet = (c_float*1)(0)
    lib.linearHeuristic(cFeatures, cWeights, c_int(numInputs), cBias, cRet)

    #return ret
    return cRet[0]
##end linearHeuristic

def logisticHeuristic(features, featureeIndex, inputWeights, bias):
    linear = linearHeuristic(features, featureeIndex, inputWeights, bias)
        
    sig = 1 / ( 1 + math.exp(-linear))

    return sig
##end logisiticHeuristic

def linearCost(features, labels, inputWeights, bias, lambdaVal):

    numFeatures = len(features)
    numInputs = len(inputWeights)

    cFeatures_pp = (POINTER(c_float) * numFeatures)()

    for fIndex in range(numFeatures):
        cFeatures_pp[fIndex] = (c_float * numInputs)()
        for iIndex in range(numInputs):
            cFeatures_pp[fIndex][iIndex] = features[fIndex][iIndex]

    cWeights = (c_float * len(inputWeights))(*inputWeights)
    cLabels = (c_float * len(labels))(*labels)
    cBias = c_float(bias)
    cLambda = c_float(lambdaVal)
    cRet = (c_float*1)(0)
    lib.linearCost(cFeatures_pp, numFeatures, cLabels, cWeights, numInputs, cBias,
                   cLambda, cRet) 

    return cRet[0]
##end linearCost
    
def logisticCost(features, labels, inputWeights, bias, lambdaVal):
    cost = 0
    numFeatures = len(features)
    numInputs = len(inputWeights)

    for index in range(0, numFeatures):
        h = logisticHeuristic(features, index, inputWeights, bias)
        logInput = 0
        if labels[index]:
            logInput = h
        else:
            logInput = 1.0 - h
            
        if logInput:
            cost += math.log(logInput)       
        else:
            cost += -float("inf")

    #cost = -cost / numFeatures
    cost = -cost / numFeatures

    #Regularization
    penalty = lambdaVal/(2 * numFeatures)
    for index in range(0, numInputs):
        cost += penalty * inputWeights[index] * inputWeights[index]

    return cost
##end logisticCost

def linearGradientDescent(alpha, lambdaVal, numIterations, features, labels, 
                          inputWeights, bias):
    numFeatures = len(features)
    numInputs = len(inputWeights)
    cAlpha = c_float(alpha)
    cLambda = c_float(lambdaVal)
    cWeights = (c_float * len(inputWeights))(*inputWeights)
    cLabels = (c_float * len(labels))(*labels)
    cBias = c_float(bias)
    cRet = (c_float*1)(0)

    cFeatures_pp = (POINTER(c_float) * numFeatures)()

    for fIndex in range(numFeatures):
        cFeatures_pp[fIndex] = (c_float * numInputs)()
        for iIndex in range(numInputs):
            cFeatures_pp[fIndex][iIndex] = features[fIndex][iIndex]

    lib.linearGradientDescent(cAlpha, cLambda, numIterations, cFeatures_pp, 
                              numFeatures, cLabels, cWeights, numInputs, cBias,
                              cRet)

    for iIndex in range(0, numInputs):
        inputWeights[iIndex] = cWeights[iIndex]
    bias = cRet[0]

    return bias
##end linearGradientDecsent

def logisticGradientDescent(alpha, lambdaVal, numIterations, features, labels, inputWeights, bias):
    numFeatures = len(features)
    numInputs = len(inputWeights)

    for iter in range(0, numIterations):
        #initialize weight offsets
        biasOffset = 0
        weightOffsets = [0 for x in range(0, numInputs)]

        #calculate weights
        for fIndex in range(0, numFeatures):
            diff = (logisticHeuristic(features, fIndex, inputWeights, bias) - 
                    labels[fIndex])
            biasOffset += diff * 1

            for iIndex in range(0, numInputs):
                weightOffsets[iIndex] += (diff * features[fIndex][iIndex]) + (
                    lambdaVal * inputWeights[iIndex] )

        #update bias
        bias = bias - alpha * biasOffset / numFeatures

        #update weights
        for iIndex in range(0, numInputs):
            inputWeights[iIndex] = (inputWeights[iIndex] 
                                            - alpha * (weightOffsets[iIndex]
                                                    / numFeatures))
    return bias                                            
##end logisticGradientDescent
    
def evaluateLogReg(self, x1, x2):
    return self.inputWeights[0] * x1 + self.inputWeights[1] * x2 + self.bias
