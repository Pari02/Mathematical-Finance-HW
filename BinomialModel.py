#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
@author: Pari
@date: 11/10/2016

"""


# import required packages
import functools as ft
import numpy as np

# create function for binomial model



""" 
function calculate the vanilla option price(VOP) based on passed parameter: 
    for call:
        pass 'VC'
    for put:
        pass 'VP'
    default option value set to VOP = VC
other parameters: 
    S = stock price
    K = strike
"""
def getOptionPrice(S, K, VOP = 'VC'):
    if VOP == 'VC':
        return np.maximum(K-S, 0)
    else:
        return np.maximum(S-K, 0)
    
        


