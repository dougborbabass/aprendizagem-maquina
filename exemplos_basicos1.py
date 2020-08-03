# -*- coding: utf-8 -*-
"""
Created on Mon Jul 27 12:09:33 2020

@author: Douglas
"""

numero = 2

vetor = [2,3,5]

import numpy as np

vetor = np.asarray(vetor)

vetor.max()
vetor.argmax()
vetor.min()
vetor.mean()
vetor.sum()


vetor2 = numero * vetor

np.arange(1,50,3)

zeros = np.zeros(10)

np.zeros((3,3))

np.linspace(1, 20, 10)

np.random.seed(1)
np.random.randint(0,101)


np.random.randint(0,101, (3,3))
