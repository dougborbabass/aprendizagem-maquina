# -*- coding: utf-8 -*-
"""
Created on Thu Aug  6 11:11:56 2020

@author: Douglas
"""


import numpy as np

def stepFunction(soma):
    if (soma >= 1):
        return 1
    return 0


def sigmoidFunction(soma):
    return 1 / (1 + np.exp(-soma))


def tanFunction(soma):
    return (np.exp(soma) - np.exp(-soma)) / (np.exp(soma) + np.exp(-soma))


def reluFunction(soma):
    if soma >=0:
        return soma
    return 0

def linearFunction(soma):
    return soma

def softmaxFunction(x):
    ex = np.exp(x)
    return ex / ex.sum()

step = stepFunction(1)

sigmo = sigmoidFunction(2.1)

tan = tanFunction(2.1)

relu = reluFunction(2.1)

linear = linearFunction(2.1)

valores = [5.0, 2.0, 1.3]

print(softmaxFunction(valores))