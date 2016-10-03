#include "..\RegressionSolutions\RegressionSolutions.h"

extern "C"
{
	__declspec(dllexport) void linearHeuristic(float *features,
		float *inputWeights, int numImputs, float bias, float *result)
	{
		// TODO: Replace with your own solution
		linearHeuristicSolution(features, inputWeights, numImputs, bias, result);
	}

	__declspec(dllexport) void linearCost(float **features, int numFeatures, float *labels, 
		float *inputWeights, int numInputs, float bias, float lambda, float *result)
	{
		// TODO: Replace with your own solution
		// NOTE: This solution method does not call your linearHeuristic
		linearCostSolution(features, numFeatures, labels, inputWeights, numInputs, 
			bias, lambda, result);
	}

	__declspec(dllexport) void linearGradientDescent(float alpha, float lambda, 
		int numIterations, float **features, int numFeatures, float *labels,
		float *inputWeights, int numInputs, float bias, float *result)
	{
		// TODO: Replace with your own solution
		// NOTE: This solution method does not call your linearHeuristic
		linearGradientDescentSolution(alpha, lambda, numIterations, features, numFeatures,
			labels, inputWeights, numInputs, bias, result);
	}
}


